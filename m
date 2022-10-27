Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E52D7B;
	Thu, 27 Oct 2022 21:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666906136; bh=OOdVohmxjyqwES6BVgivansb/UtVz9aFP/lWyrNnjg8=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=pKtWuCzhbBIk1PM0LhtiIxTshU6xE/iTaortghI75CbomsIrhKFsHXQw8TQumY9L5
	 k2qAe37H/A9uZuvnnIM1JRkFeMIpLbCz8vO5wju6oIi2Kmp++bZOsRqacSYC80WEIw
	 UZdceXgXv6uxSJC/GqSsOwPvuKGDe6+CaF9SGvF4=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Thu, 27 Oct 2022 23:28:56 +0200 (CEST)
X-EA-Auth: 12GbF3MYEzhNl3lHw/2UILN1hYg3324yD/EbSHxll6FcVpG2POaqfvUrBwf5K3X6yPxM/38dmvXLCKbUsrRha4lx6gNTmkx5
Date: Fri, 28 Oct 2022 02:58:49 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: iio: ad5933: Use div64_ul instead of do_div
Message-ID: <Y1r4EaDvEipzhaaf@ubunlion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

do_div() does a 64-by-32 division. Here the divisor is an unsigned long
which on some platforms is 64 bit wide. So use div64_ul instead of do_div
to avoid a possible truncation. Issue was identified using the
coccicheck tool.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index f177b20f0f2d..730bb31a20d8 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -196,7 +196,7 @@ static int ad5933_set_freq(struct ad5933_state *st,
 	} dat;

 	freqreg = (u64)freq * (u64)(1 << 27);
-	do_div(freqreg, st->mclk_hz / 4);
+	freqreg = div64_ul(freqreg, st->mclk_hz / 4);

 	switch (reg) {
 	case AD5933_REG_FREQ_START:
--
2.34.1



