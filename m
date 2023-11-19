Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E41B11CB5
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXbI/9lM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53e2308198dso917478a12.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432141; x=1701036941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IpbsuDxmEGfBla3FiTj7+jrIsLHV/WRQbjndZVr2cOs=;
        b=gXbI/9lMIbX2fLyVMpGmbplsSqiTUr5rZwY8HIzYsd3wW+sVt2T3195NZeQ6/denDE
         U3+k/5WR8hrx3/spv9W6X28Kn5c+oDcPnqJpTeCHmQ9wlEjOWdyWHq6ScYXZ45yIxoPp
         y6buYtbuJLlWyVxK5Oe483cG4E1Uk36iBDzmacjjB5PxJyttU2HrpLfjBcIEnCxdg/8T
         UzhnY6ghpy+xyXJzLE1km1FTlMz9aO2trBCYJ4DzroFAsB6/U84yPC+J+FaA7med3L5i
         S3mX6vuitE3iTwz38BXrmwiw3NIVPTyAcj2aGOxOYEfdLMHfrIYieZ2jS3P71VRAzOcW
         SAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432141; x=1701036941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpbsuDxmEGfBla3FiTj7+jrIsLHV/WRQbjndZVr2cOs=;
        b=IDojDkahWm2Srpqm9YFd55Zj13o5Vts8zvuy5KrPhJ4TkWNii/TCo/x95VGVcqt0oL
         3YMuVUDQR0Wx96obR33/MZv4YYx9O+24awt2oG7Sv1SelhLAxi774dyNEY8Qg7Dd2hur
         K/OGXJ+5YvqIGSsM2qt7PkkxgzUSbqVd8/HZ4OjLXqg5d5WSFzrwPO7ROQA2uu7U7EwB
         FEqnAcJY3qhLY9djWjqCdO0DvjkSGjDnV/GS5ktKD4rg9LWyFvKChhmk6kBLwyFNSaPL
         squApVDyuo/jm9CIBzKSGd4TAqIcbtugnVKYhEkFRvEYytlxRHZyfKPmCQOLQey9MTf+
         /oRg==
X-Gm-Message-State: AOJu0YxYFlKzu3xovlCtZFGTIbLx8tk7sgz3sI+pdqROVSqQqPwlGm4k
	Zj3f0Lc7GqQovCnTdWnLD8v826wlfjQ=
X-Google-Smtp-Source: AGHT+IFdaeHab3rIG4c5+rtKpdNpGPjuDibPx7GT8M2KGWYMU7Nl07OTwBtiJpoYyTwRVy8rICa/xA==
X-Received: by 2002:aa7:ca50:0:b0:544:355:16a6 with SMTP id j16-20020aa7ca50000000b00544035516a6mr4391104edt.3.1700432140736;
        Sun, 19 Nov 2023 14:15:40 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id f6-20020a056402068600b00548a57d4f7bsm887935edy.36.2023.11.19.14.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:40 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:39 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] staging: rtl8192e: Remove unused variable global_domain
Message-ID: <5e7a0753ed9d6d934203fe29ab8ecef41090f055.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

global_domain is initialized to false and then never used.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 2 --
 drivers/staging/rtl8192e/rtllib.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index b8ba95a65f27..fd488e2fa815 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -26,8 +26,6 @@ void dot11d_channel_map(struct rtllib_device *ieee)
 {
 	int i;
 
-	ieee->global_domain = false;
-
 	memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
 	       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
 	for (i = 0; i < channel_array.len; i++)
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 1d0878d1f696..820951602fb0 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1322,7 +1322,6 @@ struct rtllib_device {
 
 	/* map of allowed channels. 0 is dummy */
 	void *dot11d_info;
-	bool global_domain;
 	u8 active_channel_map[MAX_CHANNEL_NUMBER+1];
 
 	u8   bss_start_channel;
-- 
2.42.0

