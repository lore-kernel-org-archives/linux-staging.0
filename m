Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A69746C;
	Wed,  2 Aug 2023 13:26:39 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b8ad907ba4so43874315ad.0;
        Wed, 02 Aug 2023 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690982799; x=1691587599;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62tLyHKB7NhhD1kHbXvVqqK4h9kH84tdATmgYG26w80=;
        b=MIUuUVV2y/RySNVvTqx40t16UomQXc6hjooSVqw8Ffxdr5cqFbnW5yYzqJ052NI9dj
         Jyl0e/AdCrrRPV4ifg9CREkxIhYkZkR6vV8OguslkM7C4BOVuklGxBLlF80yP8Uxo1ev
         +umo34VNCgkDyAMrwki/7Ku56lHMslVYJWuCea+rdHa21ypHyrjaFUXDSX5QgltRVu1R
         JdU7JUQ8NPJe82gURQHP8Gi9ys8owfEKN6gH0wH1xKXnJKargc5C9F/7X+lY9KJ/SsMF
         e6CMAhFdKQtjzp5KuuBVhq24RRJBcH6GJ8iwodB0R+xyfQj2MbNfVTwTeF/KoEyTvW1I
         TDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982799; x=1691587599;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62tLyHKB7NhhD1kHbXvVqqK4h9kH84tdATmgYG26w80=;
        b=QR9k9nImATJ47ArpABVPsqEhfAyNqigFeX/sgmsSEiRUvlxltXCjxW1w0+9QWREK8/
         0/GRcFj8SN8VgiyTKHe7NYC3qBnOg0B6k3yizrd/gXcqC7ml00Lrfwu4dH8mD5S2zQr9
         bmNnaoRHhGR7i+5Ke1dXqSBqLoUrWThJjClVRe6VNPIs0LFKBAzSUaeVZID7AqtI2AhX
         IN3hlul1XYMG/nKoIdU7Yv+vpTLvfyf/qoAAJVNUMD9FpTG6maCs9xtT0KSzNZcFGwUN
         VxOTbVg1PDV3rM1Lquf3SI6ttjAxXSHFAAT+bVJxNWdoLGGsShikpE0pNKL1sJ31VrQJ
         K3Kw==
X-Gm-Message-State: ABy/qLbcwPnKCPzLPzWgsQlOwx9a/M6LV33ZtNaFFDEZKpy+EYWjZvB1
	2eg4Umwd6pQCu3vL36N3gjU=
X-Google-Smtp-Source: APBJJlFcaQgSc5D0knc8GrQQt9OyOoEYMbQGAxcSSCq0Lxjwk83HtDZubLPr+Vxh6q4vWCCTsh6lig==
X-Received: by 2002:a17:903:124c:b0:1bb:7927:c1ab with SMTP id u12-20020a170903124c00b001bb7927c1abmr15609255plh.48.1690982799108;
        Wed, 02 Aug 2023 06:26:39 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([223.178.255.173])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b001bb24cb9a61sm12413401plc.265.2023.08.02.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:26:38 -0700 (PDT)
Date: Wed, 2 Aug 2023 18:56:35 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: replace camel case by small case
Message-ID: <ZMpZixfZ4WQgpzF1@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace array name of camel case by small case. Issue found
by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 0e135af8316b..8b913c64845c 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
 };
 
 #define CB_VT3253B0_INIT_FOR_RFMD 256
-static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
+static const unsigned char byvt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
 	{0x00, 0x31},
 	{0x01, 0x00},
 	{0x02, 0x00},
@@ -2005,8 +2005,8 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		} else {
 			for (ii = 0; ii < CB_VT3253B0_INIT_FOR_RFMD; ii++)
 				result &= bb_write_embedded(priv,
-					byVT3253B0_RFMD[ii][0],
-					byVT3253B0_RFMD[ii][1]);
+					byvt3253b0_rfmd[ii][0],
+					byvt3253b0_rfmd[ii][1]);
 
 			for (ii = 0; ii < CB_VT3253B0_AGC_FOR_RFMD2959; ii++)
 				result &= bb_write_embedded(priv,
-- 
2.34.1

