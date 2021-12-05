Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A740B2C80
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:30 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id l25so31980161eda.11
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HPuzYR8QORZOgJOB4QKAyq9QStxUBqC+STv8VWMkX4c=;
        b=dORf0ZDwVI0bp2YAX6DjjLwYiu6PDTIfH+w4bFIVgNqgeMIgDQOdS/x2boZTsS7QCX
         IJDCJ8sQYXQD7hxVsTKrN1NiIabzVYoTVb3D8XjUCqqpVhWz+XElAYzy1lpPEENnGf//
         dDEhI885bG4uWKacsteRKwrpP1UyejwCNRFopW99QPctEPbjtxdJMMDxZNcg2FBhRfOz
         EMgoIfMkUhi958HXI3QANp2thC5VHJF1hBYNauQV9haZ0IuykxobCXGBOad/6fbnzghV
         5j6Uo9X9xeL2+en1FpFFElSGUF5xnLSpUp8ghrBXa5i1oGkjn/2kqCvgT3Iq40gDTKpY
         5Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HPuzYR8QORZOgJOB4QKAyq9QStxUBqC+STv8VWMkX4c=;
        b=DpydxcQY/eYFghQ9CLSuNXvq6dFB47TvDfFOComG9l0JLw8a7Nbm/hlc2O1GQi3Doc
         xACF2bIDHJbXbdhg6T5heQWsS/VnnXV7M6VpjEmAfHo1efXbP2fxZ3XudKWSkcKRa61Q
         wIWJ4Wh4QwmKD7GboYqPnZ8vYznXgE8ZBRH7mDnO/q8NPscDN192SvNb6eKTljABmgjU
         gHvUPek/r7wUKX2MkcRTqngXEv16YpJcnFSDVP+DAsujQHt5O9Z8+YOPFTEWjp/5QMyp
         eK6vx5OX2mwtfMGPH1RpxjRSALP+uhqsV9RalJmnct1CCwPUsT6XM98l3N6YN3/uHaHL
         E2eQ==
X-Gm-Message-State: AOAM532kigxv7zLuzWvoeErs53Gd6FlPugmechU3eHfezCyPNeqBGqE5
	vGnjRXGrQIU9Hh5j0dV/+xM=
X-Google-Smtp-Source: ABdhPJxw+P70SMSYbVsQxn1RJB06jY5o8uI/tEz3sSB/gbN2RIdsO7CwZBVYG5Bw29gZcvdlhyWWuQ==
X-Received: by 2002:a05:6402:1768:: with SMTP id da8mr46181832edb.252.1638712769075;
        Sun, 05 Dec 2021 05:59:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:28 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/12] staging: r8188eu: struct odm_mac_status_info is not used
Date: Sun,  5 Dec 2021 14:59:09 +0100
Message-Id: <20211205135919.30460-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205135919.30460-1-straube.linux@gmail.com>
References: <20211205135919.30460-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure odm_mac_status_info is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index df232867eac8..f83b94a74b70 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -176,10 +176,6 @@ struct odm_per_pkt_info {
 	bool	bPacketBeacon;
 };
 
-struct odm_mac_status_info {
-	u8	test;
-};
-
 enum odm_ability {
 	/*  BB Team */
 	ODM_DIG			= 0x00000001,
-- 
2.34.1

