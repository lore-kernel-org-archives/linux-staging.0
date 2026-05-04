Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93A92D3EC7
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877657; cv=none; b=TNh48ZJuTO40Cs/4ZZ2ybNBQ8ADQu64ncnu0h8K8m014l2eAw87pIzHZ0hkTvp08MNF2smTyNVvKAeIq4X6h3fYbsrbOdP9xDXXiSgaD3ZtHEQG3pkCXc6gwcAELEfvuVgt9XRLtHtAkLJ3IJNsZOE9Z8ZyY1noqwVrCwn/RJ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877657; c=relaxed/simple;
	bh=1ZSaYK9KkfV5+GCoFqf+X0v1Q+Y+dHjA70Bg+RMm57U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fk3p/fw4y5XVjg6QJeGsvZOjaAoguoLfOtXhEHzvVLFbGbotgJTD29Zt2Qtp2k+rfr185mpFA8y8af421UqOir+j6VSGE6ZmK5QF2z+brX4xGKJaGwOdQw6O7H3as912d8BOD30j6QWO47xKZiPbWJ7/GkrMWUvIiw6xG1I6a8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X3szrpEV; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X3szrpEV"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a865004748so1723547e87.0
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877654; x=1778482454; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnXlL3KzWzfPtDefDXKY2+uDbjeKnEfIYOtp4pEQbxI=;
        b=X3szrpEVOP2RAmoLfXYIRJCUDaPw2nOvDUksWNr8X6b0r+LAzSPB6ajRNFUZJ7zrE0
         T99Gek2uzy2tm9j36H1gmCLLsrQtjuoRhx2KpyUgm2RuSXphV6xsFZlYOGMgCK9D3/sv
         28L+hUQBKpRBPZBtjwNUnLnvrum9gtG5/1xH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877654; x=1778482454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BnXlL3KzWzfPtDefDXKY2+uDbjeKnEfIYOtp4pEQbxI=;
        b=akoKDgaOsA606AZOlHrGegbUUDsZ+fRcNRm6Atre8vcj/XUh0RR0d/51E5s4kVnFbV
         IeCYsIfs62hKs4F3Yca8OorxdGszIAgk0aa/T8a7KHjvcO/vZD3XO9gOZuDWdtSeVlm/
         tOyV85kTZR7G60G47/gy5eOvDGAZEzsOYHFJ1nIPiUZGuPRRAG5I1u2q4aTpRUhgENdP
         mRNUqxXvaIQkBjL7/uHM7ybtOVE/7dyRr94sAcnFJF6nFzCGyiYu/Veyjb7EC6y4X8G7
         /lpdNymm91Lk3NbagGz4HGcFgWjEViYDj0sHvqC2k6jk8oIK0tgpiG/FAprtXqHm7ezW
         XC6w==
X-Forwarded-Encrypted: i=1; AFNElJ+vvD2Ss7ub8da18Qax+jl3inXCzwL+R/ddgdKnQs6/v3+Dl8qZ4GskH3khvpy2jdi2MzT3LdHdcAcKhTLU@lists.linux.dev
X-Gm-Message-State: AOJu0YwV+x24GTz/tT4XQ1ruyqeyEEuViuJ1VnsyRVlWV6dGks7fjiDl
	hAI3Pvjqah14ocCPSEvZhXU9I0nB2QYtBnTTNFfBK4fYOjM8PPhEH0Umxec2eYc7qw==
X-Gm-Gg: AeBDievVSTLH08Z6hywwY+KAeIbGg8HDX8U7hQ31kOGUL+XaF1XBPDCX2xC/DlzmBNo
	TgLrIoTt/OdvgJjUm61g3o3xZu7UCZ6Zd+6G3+o9G+GWyjTp+taD0+HgZmm5v+oPntyF1JGFxir
	+acupdp1SJ8jlJ91kXAWUxMCcTxYjEAQUXvMzJv67d8cxrXCsryjJh3LVdY3RAGhU4j4G4WLs2c
	CKW8f98jYIbLSoabm5bVew3wxmip2Bx1J9U2EdJPZyIdIqwtMoRAqarLmtwQvyQvDGVCjoko6/+
	vY1igB9pD6DIikXu1Kj+T3d6ILrtLD57ifONpCABlCZH6kx2STSX++BFil5ksfD8sg+mvBttzoA
	w0YFXlTBDTD/IbK/sULMmaU6vzTi35QgCfHxIQzpNXhRMMY2MaQuX2iHiAhjwLcc7utXJFXS0HY
	ARlOJYElrXFt0E8Mt8Bmks7TMug63Ofini5QVL9d6G0U5K8D8aBodGC9Euc7wwcbzJHi2uqhne0
	aAS+XziDt7mFjry/A==
X-Received: by 2002:a05:6512:3e18:b0:5a4:299:285b with SMTP id 2adb3069b0e04-5a8621509dbmr2250062e87.12.1777877653936;
        Sun, 03 May 2026 23:54:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:06 +0000
Subject: [PATCH v3 3/6] media: i2c: adv7604: Add range checks for chip info
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-3-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3

If the driver's chip information is invalid we can end up accessing an
invalid memory region.

This fixes the following false positive smatch errors:
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7604.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..ae75982fb514 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3668,6 +3668,12 @@ static int adv76xx_probe(struct i2c_client *client)
 
 	state->source_pad = state->info->num_dv_ports
 			  + (state->info->has_afe ? 2 : 0);
+	if (WARN_ON(state->source_pad >= ADV76XX_PAD_MAX)) {
+		err = -EINVAL;
+		v4l2_err(sd, "invalid chip info\n");
+		goto err_i2c;
+	}
+
 	for (i = 0; i < state->source_pad; ++i)
 		state->pads[i].flags = MEDIA_PAD_FL_SINK;
 	state->pads[state->source_pad].flags = MEDIA_PAD_FL_SOURCE;

-- 
2.54.0.545.g6539524ca2-goog

