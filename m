Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F5315AE6
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NI/9mO1P"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c1e8458b9so6040475e9.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702222025; x=1702826825; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=geLw7oiaKYTuY2XiNNlgp2W+j2j+NV9E7iJ/5OuM2YA=;
        b=NI/9mO1PJqyCUfAQMlF3llkrH19SEYHxdlo6otpKY3Z4PfdtCh5SOFg9Z1XzawPYxp
         8jmo+nKke4tP4gTtKZ/WlbR58u4mA8ykV3pEs9EXImQXjHyZsKiLXzwvq0OU0ZRPWLyP
         SHXtsSiJWDo1BtrlpG9gY+a7C3X446QajEXABGOElCjEEWYYpdBEBWe0igLLm8OYYb5P
         UEWsTllJr5BkDZvL9PETxF9wqQUeHMfSrZAbU6hKN1jAQgUx+/zPdudX+VPzecvx2fGb
         8T8GDAQUIa21C3tXeZmJp/mq0d2ECl181GhdV3D78oCi46ONh9wSIDiSEFejMVCdMDIq
         +EWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702222025; x=1702826825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geLw7oiaKYTuY2XiNNlgp2W+j2j+NV9E7iJ/5OuM2YA=;
        b=m9AAi4M7mZl8ESARecHEEybRgM6Gxph5lmKfGUUCm5rOZZzRAdxpI/wGAVEDbIuL5u
         qZJgY1R1qO09An5YxvpYnxMQFhgAFOhrf67Csfmsr0SCjcdnD40oGjAkJbdUEBfDoa86
         2oAJ2rP0JanxwE7FLDQjiaN6sAen0sLxJzxpIm7QOa2DIfKPbzW257gZ+VT6R+WNCwRN
         I7P0nmNXEXurIKj8fAtkTlojtgdO0RsMU+Xf7WJhRPjUCHwCMoxpB0EkljP7SLwDWgWs
         B5y/47ZAFaqgOCxiNbq79UHKWKrA/ElhlvIVaC+w1JeUfuxLVu6AbqZ6ZIMFUlabDoGB
         caMQ==
X-Gm-Message-State: AOJu0YxzhljfXmWLH02jqjPgvdbD/tKqoTscXS5JAuZMpPIVlHPjCqBP
	M6zsOm577Smfsjpc/d8wmaIg4ag4048=
X-Google-Smtp-Source: AGHT+IF9WyWBDNKFv8tAvjn1xZzkvUYPZW8FYaBnWJF2y8KqdJlSpf/oidoYYUZxpb6PudMK7ZeuPg==
X-Received: by 2002:a05:600c:524e:b0:40b:2708:2a52 with SMTP id fc14-20020a05600c524e00b0040b27082a52mr4018653wmb.1.1702222025086;
        Sun, 10 Dec 2023 07:27:05 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c35d400b0040b538047b4sm12250228wmq.3.2023.12.10.07.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:27:04 -0800 (PST)
Date: Sun, 10 Dec 2023 16:27:03 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] staging: rtl8192e: Remove struct ht_info_ele SelfHTInfo
Message-ID: <e8692d40b3cba3de1b4ceb8e72186e8d40afec73.1702212003.git.philipp.g.hortmann@gmail.com>
References: <cover.1702212003.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702212003.git.philipp.g.hortmann@gmail.com>

Remove struct ht_info_ele SelfHTInfo as it is unused.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 416633b88446..0f27c820ffc5 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -99,7 +99,6 @@ struct rt_hi_throughput {
 	u8 cur_short_gi_20mhz;
 	enum ht_spec_ver ePeerHTSpecVer;
 	struct ht_capab_ele SelfHTCap;
-	struct ht_info_ele SelfHTInfo;
 	u8 PeerHTCapBuf[32];
 	u8 PeerHTInfoBuf[32];
 	u8 amsdu_support;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 439b43faa2bb..0474594a4b96 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -554,8 +554,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 
 	memset((void *)(&ht_info->SelfHTCap), 0,
 	       sizeof(ht_info->SelfHTCap));
-	memset((void *)(&ht_info->SelfHTInfo), 0,
-	       sizeof(ht_info->SelfHTInfo));
 	memset((void *)(&ht_info->PeerHTCapBuf), 0,
 	       sizeof(ht_info->PeerHTCapBuf));
 	memset((void *)(&ht_info->PeerHTInfoBuf), 0,
-- 
2.43.0

