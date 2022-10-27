Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E77B;
	Thu, 27 Oct 2022 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666907978; bh=K6jkaIWLjM8amIf1/3sGKi76LC/AewW04KWQY65UKW4=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=EhiA4AHsTTAS+Eve+c+tPPzPBk4XEFkyguh14hRkAHRwMxzOpas4XNSLmKADx553e
	 V+VlYpHUhA6fWSZ/Fr4XnDjrbbpIKpWNXpgr/so07YXy4YIdA6TI+fsCEpAh51pXTW
	 ebmS/OTl3eEmGDu4/n4N3QIX6oXueJi1rfywKEKg=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via [213.182.55.206]
	Thu, 27 Oct 2022 23:59:38 +0200 (CEST)
X-EA-Auth: gPds8du2GN4EigpVxAh6zYgunt9VQITGmwhvWpkx/yxVDikGFU9mBoo7as8yKS+di+ACDryNiOD5yTMHezgeh8p9CD8AOADG
Date: Fri, 28 Oct 2022 03:29:32 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: iio: frequency: ad9834: Use div64_ul instead of
 do_div
Message-ID: <Y1r/RAk83Csk2L3E@ubunlion>
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
to avoid a possible truncation. Issue identified using the
coccicheck tool.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v2:
   1. No functional change.
      Include outreachy mailing list on the to list

 drivers/staging/iio/frequency/ad9834.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 285df0e489a6..3917a76e7976 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -102,8 +102,7 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);

-	do_div(freqreg, mclk);
-	return freqreg;
+	return div64_ul(freqreg, mclk);
 }

 static int ad9834_write_frequency(struct ad9834_state *st,
--
2.34.1



