Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3B72
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 17:31:40 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id c20so3728958qkm.3
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=jZ8LOmff06oPPMAKh+a2jwE6y0ctqZ6V1VXFOR4SU0w=;
        b=UVVyfsvBXooBVNH5JuyXsbzu1D7n933coq3oC53JqIxd6tmmdmqRyFWxqyOXM6XR6w
         12KpGePCNG4lx2ZhnoACF4gHLgEOxeiiC4UaTBvC3CvkEH2QF/x8x/0MjNDI8e09HBtr
         3u3vm+CpRTYH7tQimi7hPEYZNzX+36rZo2cUDHuUqGmjif10filwv0wAGeBhjxN1WWhP
         dXDThqeDxngrKRoi040j4Bys18LFIYzD8/AB9e7FnVK1f/7Sh6YY+OR1HaMdT2QWp+wY
         xUoLigiysLE74nh12lL4E3XabsdZ3aOYjLFWaxIWUO5KfOT1rbq1Pr8vZBUJFQFEE5/8
         umkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=jZ8LOmff06oPPMAKh+a2jwE6y0ctqZ6V1VXFOR4SU0w=;
        b=ovkcln33mxLE2u5sBaMwEKeDClrIFyVV1oYiocXV+WbfM+Jzc6Cm4HXcEJoHdhzO+z
         lS8cgAwbXR8LFyL7ggho6Yofk5qM/bAhDATZ68qCW0oaD1H2TKS0qBjsjOfcd0zgnJ5n
         a4/xT4v1JVOEtFkC7k/1Mfh+mJRM2DKHIK45Fs6YzBOE4R09Tf0MFbmAt7HSSdjmm24y
         RIjxKTkoPx0b8Ir5tCp3RaM80X8EhazvMRJsUjcWM4RIZapDD+/cJVeTal+gJ02YPvgu
         IX7oRBILljIJXiGSyaMbwVq8z2kS7o4tzp0Fk7ylMiz9/PQKoKGfj7/Z2E3lESUUwW/j
         g12A==
X-Gm-Message-State: AOAM531tlTvWbUBkT1PcO2VnFFlvQEdZPHceskmXW/KZc4RPcRH/pJAy
	CADrotkYvM8A3FUj80CpPfc=
X-Google-Smtp-Source: ABdhPJzkYHi0xkBNpfuJGhU5qaWfyPJAcIei0SZhQV69eer7522bZZIhPdUn7fY6aRBYl+UJYNRUCQ==
X-Received: by 2002:a37:a995:: with SMTP id s143mr51224554qke.414.1621186299470;
        Sun, 16 May 2021 10:31:39 -0700 (PDT)
Received: from yusupbadiev-17Z90N-R-AAC8U1 (ool-45788941.dyn.optonline.net. [69.120.137.65])
        by smtp.gmail.com with ESMTPSA id c185sm8849615qkg.96.2021.05.16.10.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 10:31:39 -0700 (PDT)
Date: Sun, 16 May 2021 13:31:38 -0400
From: Yusup Badiev <ybadiev@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix typo in commented code. Issue found by checkpatch
Message-ID: <20210516173138.GA586734@yusupbadiev-17Z90N-R-AAC8U1>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch changes the typo "Atleast" -> "At least" as checkpatch.pl warned

Signed-off-by: Yusup Badiev <ybadiev@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index bbf3ba744fc4..45afa208d004 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
 static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
 {
 	/*
-	 * Atleast for ES2 we have to meet the delay requirement between
+	 * At least for ES2 we have to meet the delay requirement between
 	 * unipro switch and AP bridge init, depending on whether bridge is in
 	 * OFF state or standby state.
 	 *
-- 
2.25.1

