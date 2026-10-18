Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BC94B3C94
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329180; cv=none; b=OCfQs6ZQoaJE6Y/n2qrEUVc/vgasviGK1njtZ3MH/pWx6hKCDIKWHdyuTn0QfsS5tcCUXIzWcwGrvKnvlUrz+g06LCRLq8t+PA1QBcLIhpFHEZyt2176dkGc/AiS0Ho/+2vaKbTxoIkqroTZaam7m5Bj3JczK4X38XezAXacZRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329180; c=relaxed/simple;
	bh=N2JeCWLFfoU+fSPfPomIYnFMAghodOlr4AC/9OfNW88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NDDIQIPzvHygjj/kGKyyRwPb/FGSjTrZm+Oc1StN3tjbixPLnGKjV7RbJqfkYSO4xVlp4unzpYrj6RDOg4N5THSIXVgkrtAKQbXTm8DKI5SVyhabnsB7vbO3nYOcJZm24zWB+Eebg/ZNDpamELqbjRbJ2ZMK8XaCMc1ptjCmaq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImVhzLSL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImVhzLSL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so3957595e9.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792329178; x=1792933978; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEOyoCt2AD7D1bry5/d2H2T1Ku2G2ZXxRyhNNZRqt9A=;
        b=ImVhzLSLRMfxgcJKPROfW0l2sJ8YE0N0wIDbMjAtL0/xVRi7n7Y8U2SwVVXNikJB2z
         CXJOf4QLMWv0MxiKhw1JG7twJU9+14RnS/qc7ENQwqv6m9C8+CW9yutYQwTTVoULOG43
         nEei+sXvgBa799LNwZW7Wy3hCuBwNFji6WIW8FtpOpq0eAZDd7XknXia0jMX73HiWkA9
         m5EaXjZfwqoAWTVSu+VMgWqK42AzEwlTjYNb2EV46g4/ln+e8MiDdHlqWYu7lanNvRKn
         DSQeu20bjvTo7559D945SvGbAab5WY4VKWWcSxir+sKpq8PaTk9S2JuEUO8KiWLEY3Aw
         gOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792329178; x=1792933978;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEOyoCt2AD7D1bry5/d2H2T1Ku2G2ZXxRyhNNZRqt9A=;
        b=iAM/Ar3v/src2ou5KWUxBvuokv2SIRGkbJNB6uB8wgH0r392h4Rcff4t29YO48KSRL
         J182xa2rm2glfGQ1T4bGbNNX4wjScYQhxYKuC2ghfTvGsdi+yHsnoTJjqrnkJ0X4asS/
         omZd45gEbevs3r0G0duXzLp1L2Utpv4F8WSMY6sLi09UEE5KMLCKcj9WELWsx7k9DFzY
         lTv2d2dECvW8KDvNM7ovOxNvKJRrFRm6yzisX1esI24ac+bgmmVzdeMsvH6+RQJCpLv2
         QtH2PBcDqviUrlcuhJUqg0ihWnkSyjQQRBKJUyfmR47B1gsQhEQ7dVuU8VfJah8jfEPf
         GLaA==
X-Forwarded-Encrypted: i=1; AKwUvBz15o4H1lAjLRJUe40BPtuhE0BBmJAtvdF7J9P4SXmvKA2zYKiVqn/MQwQMGcGfpQPfup65nfuCK3nOS0I0@lists.linux.dev
X-Gm-Message-State: AFq9FYJtYdXoW9MNKwQ09SPSrhuPfbzQLe2uMaaeJ9VjdYCcz0nrvRwJ
	oaACJ/kV0giP9XdCmZseKiVQ63PLz6BZaqToOK9kQyUHtlc6oQ/v4jI7p9VUMuOo1NkMBA==
X-Gm-Gg: AYBFou2ue/fGS5Z8W4E1A9YDkabPn4DW1c8AhRLCMknW72f0JOzMj13jSuxQ8aOLkFV
	L1PmSdV0B7co9aUd6/FKSgFxynnMB2ocw4KzTwFo/VOgKZSDZXhyN6l5T+mKyPAM6S6BKMVw2Z+
	7w7FkbwzTal+SUn6QAD/zsVde0Ulg17cQo5SOe+7JwPsXylPfx64NWMmAhdm5hlS8TWhOKCrZgM
	HtmjzyalNvIlJqOA3t6uRT3CLaBAiwSl7qTe8k+Y/e7hjBPWZt4DMnBlTBMfYpDBup4bD99Ljqo
	aUJdIEiPo4ZHIbnekuzeHmrPa6TBuEY97xkxoIgEulAehiQWciF7iK2dXMiF57BLJdh3e42Lmre
	acPErPuaS+wBI1QxGlPMc3Wx+cSzFn5Y69GBvVe3xetZ4wPTOiKyylsK/ekzXs+TACb9BjK4Ev6
	U42Wh5QWa9istN5xuWEEjOCqKw4SSBvUIr3MaaPC9E+1B2Jv/fdkXZHSqSjbHV
X-Received: by 2002:a05:600c:3b2a:b0:4a1:d1f7:bf4 with SMTP id 5b1f17b1804b1-4a1d75fcdc6mr113855015e9.12.1792329177346;
        Sun, 18 Oct 2026 06:12:57 -0700 (PDT)
Received: from ubuntu ([102.91.81.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm323603155e9.9.2026.10.18.06.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:12:56 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:10:39 +0100
From: Comfort Oyewole <coyewole7@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visiongravers.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: comedi: comedi_fops: fix alignment to match open
 parenthesis
Message-ID: <atTFT49xpaBEb7Wn@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the alignment issue in order to adhere to kernel coding style

Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
---
 drivers/comedi/comedi_fops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index c09bbe04be6c..efa6dc6d40a6 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -2648,7 +2648,9 @@ static __poll_t comedi_poll(struct file *file, poll_table *wait)
 }
 
 static unsigned int comedi_buf_copy_to_user(struct comedi_subdevice *s,
-	void __user *dest, unsigned int src_offset, unsigned int n)
+					    void __user *dest,
+					    unsigned int src_offset,
+					    unsigned int n)
 {
 	struct comedi_buf_map *bm = s->async->buf_map;
 	struct comedi_buf_page *buf_page_list = bm->page_list;
-- 
2.53.0

