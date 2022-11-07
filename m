Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1C17C7
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 04:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667794206; bh=4vpubAxBJPLICHSVHvPCZgQDNFOK73r6037oLcqxRNw=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=C9iFnW7RbBKdhCtxtXzOLa3JlnRrnJ7VcaqFqQVVR90dK9DJVByEiltrZ1pYEHdXW
	 HaZ8FnufHYDVsG2dFR2FWw551lYOjE8LaT6/W7ah0A/HFTvl89M+WhaAXckJee0i1y
	 ThqaZvQWeOJGzQDG1BwXvTM7OKTLYLbeKpByI7oE=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon,  7 Nov 2022 05:10:06 +0100 (CET)
X-EA-Auth: xmv0Uzdl1lJntsxK/BrE7s8F1LLtHp58aHBwFEduoB5F/pQe89jIg2LygmBdI/VKxLWHU6Cnupv4LfA4oPG2e08H69d/mTW0
Date: Mon, 7 Nov 2022 09:40:00 +0530
From: Deepak R Varma <drv@mailo.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: iio: meter: use min() for comparison and assignment
Message-ID: <Y2iFGA3A1w+XMlYU@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Simplify code by using recommended min helper macro for logical
evaluation and value assignment. This issue is identified by
coccicheck using the minmax.cocci file.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/iio/meter/ade7854-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/meter/ade7854-i2c.c b/drivers/staging/iio/meter/ade7854-i2c.c
index a9a06e8dda51..a6ce7b24cc8f 100644
--- a/drivers/staging/iio/meter/ade7854-i2c.c
+++ b/drivers/staging/iio/meter/ade7854-i2c.c
@@ -61,7 +61,7 @@ static int ade7854_i2c_write_reg(struct device *dev,
 unlock:
 	mutex_unlock(&st->buf_lock);

-	return ret < 0 ? ret : 0;
+	return min(ret, 0);
 }

 static int ade7854_i2c_read_reg(struct device *dev,
--
2.34.1



