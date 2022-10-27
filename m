Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBCE7B;
	Thu, 27 Oct 2022 21:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666907670; bh=4oNdMi2kwzVQqP/G4iEoq1fG0MnLzqOREBAq7uQlKko=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=e64bH2KCF/NhJoK7k50x0726Cj5ZS9rGv3hbTf8tz3Bm/9XvAn5m+EMVyt2HlMW1c
	 dvqfdpENHQrLWJtoicI2guChk23LV+q9UGLQPqoaBLAZ/D/NfnF7FaEML1GJPO21lx
	 JvYGG7Wads6WLSJEnsC9A7xyJ7uJ1kKqmfZa4VFs=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via [213.182.55.206]
	Thu, 27 Oct 2022 23:54:30 +0200 (CEST)
X-EA-Auth: pBtERwH+CqDwwoap8myOtvOhAxjDOFlSbXiE1xcZX4jb77aRpGyBPzTOL5KKCfbUA5uF7kSH2l7vbDTeoiapN5VOEN0ZNqsl
Date: Fri, 28 Oct 2022 03:24:24 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: iio: frequency: ad9832: Use div64_ul instead of
 do_div
Message-ID: <Y1r+EHqpVz/HYrIm@ubunlion>
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
 drivers/staging/iio/frequency/ad9832.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 6f9eebd6c7ee..a8409f6b1c4c 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -122,8 +122,7 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout *
 				     (u64)((u64)1L << AD9832_FREQ_BITS);
-	do_div(freqreg, mclk);
-	return freqreg;
+	return div64_ul(freqreg, mclk);
 }

 static int ad9832_write_frequency(struct ad9832_state *st,
--
2.34.1



