Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E702E3BE623
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 21:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708257; cv=none; b=pIOViHR7Fo98hW+RXjgs8M7F97Zzav7FPEIb//WzgnCzB4z/0D85ysYi/EeiDJ/+/nvu926Gu0HQHl+mqv4TIuz1o9KqCvcsOEFmaWKzcN0GwGu7NkcB9AKU+8/Cm/JMmjrSsCQBGgoyVK0+YHphhbsZckSIQGEE5vFjyl1+gLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708257; c=relaxed/simple;
	bh=bEkjrvxLwNsk3Ygo4xygQfzrv3jubAsiGLQ85EFScy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dXoDvFfV+3dTBvu0jbKfl+15xFxe+4MJOmUyEoE91CMUj7SQ4koaTjUMwuHfau52Y0adp8XEo3f0SxYdctGsEjaa8u2cUga/iNnXE4NNTypYqa+DahmOv2k9wvPBVYCGmIvBl4CUn34KmgM1vY0BmXiroU6+MDKwa72xDGK+ee4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1ysz2MR; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1ysz2MR"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f7020a928eso10245321eec.1
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778708255; x=1779313055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnlBKVaZbgPOGKImgHVu93eokVaAQ6dF8+6au0O0uLA=;
        b=S1ysz2MRqaFqDTUIsEFI+yKEfzo8gqkAZGeSqfsoX10nUXp9mdDGUgPstx7hRHc+uW
         kvuXxX4kYYooEFAR8fD+HvKYniE0KDESKLRL5i/XnDzXE8y2KAFDmXfeOG5OXn1desnk
         PAfRx+4CqkYkY98Sjhtk+xnq8uMPxai5PjRLo14PNdNf7lwEh8BKDLof+4g7qMvtAD2x
         2svrnd9M5Ftn3h8V0esENmAHFlfcZgSH8i9OJwv2ASU6GznezWJ5e/D+lR/X/BYA7v5l
         Qv77ev6fq7R2dxaGdT6RO9halknem30bt3rjv4ZMJvDAtfrPol7TPH6bAsVWFoKdWzsP
         fjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778708255; x=1779313055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnlBKVaZbgPOGKImgHVu93eokVaAQ6dF8+6au0O0uLA=;
        b=WzFmE3mGPMxFF0VkFUJI7fjZFdhkMydq38No35zSWk7OIJB11NJmAj+yhe3KCpLcSC
         nueJMbubFVb5vlpzWIN/cY2rv+FknMLgqF77BPpdmY4rdHRWWkH2FgWhAy1DKt2VBbE+
         W+v983nHCLWCXk/b1t5lhpNzcQOtkJjqwXsBjMu4wraRgd/5dz3Ocjr0qhW01NwVu+60
         s+EoqmRPRkWrOQt/8Tvjlv4sUznkZzdiuOoRFumq1XrMD0A8KKTX9sfZ76e+NezlkHZ3
         XKfNfSnV4MdrnlL3LWyWO+QvG3Qf9Y8aG62fq/rBmyzPqNKeBW68GKl1shD1Yy0jBby/
         h1Sw==
X-Forwarded-Encrypted: i=1; AFNElJ/mfUZBD/H92OQz9gsg/xcObsHPZ4bMb1Bw93GcqkZn/XVOESGoNt2gftAw/5dy+F00NHU9BV38f/wfypz+@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/S980ANQmjqY+wcVB4RIABynkuOPeArpgyC1NAwXMLSK/uHbF
	teaGDrMqPCGTUi8pwlPb/1WeOehs2tAiOKLrlRKOmUZeImFPg+49wz7b
X-Gm-Gg: Acq92OH+eoSLqPstl4DKIyj8TTOtTAO2yJMC+gIrtboacnQRoF8KMBT22rrblN6nBNe
	6nHf+3R1XClw8Uv3n1nxZtpYENpHuVulJuA78QP9bx6zXYOamYV+QDRVWNpp9FR0YOVxAor47DK
	hKMSOda4SMXTg3VjpL72KSP6LhDzcuy6BuIKM5OBWzgSUdZYO4rmSzXotTc3Ta6RkUnRYVAIhKD
	VLTz4NJypsF7vuIqW5JydRCjFD8zY0wwTb7LVltw0aEoLfWUEiPAApFy8YlyTaK4bAbaJXQTPV0
	UmjDTzIycH8vZUCxRNxqHm9GAoguiOzYpIFrvkgXJspg8OsWwagLWO4+iTZn3SRCiy0JOYID0E/
	Wxq6deC6/KUKFdwm82ryhDnx7iDMJ2VTDlyIB6vxXMpRGCgpeOI6AjZsOQNZkwOZuz1hgk2OvNs
	YqBw3NlHNHrK/JjcAEzdAIivR+eInekgSHG+o0Ja5htPMr99V0Q3E2ZNY=
X-Received: by 2002:a05:7300:6c28:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-30119f59550mr3090145eec.26.1778708255076;
        Wed, 13 May 2026 14:37:35 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e69esm732316eec.1.2026.05.13.14.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:37:34 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: simplify rtw_enqueue_cmd control flow
Date: Wed, 13 May 2026 21:37:18 +0000
Message-Id: <20260513213719.12246-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513213719.12246-3-dennylin0707@gmail.com>
References: <20260513213719.12246-1-dennylin0707@gmail.com>
 <20260513213719.12246-2-dennylin0707@gmail.com>
 <20260513213719.12246-3-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the goto exit pattern with direct returns to simplify
the control flow and improve readability.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 0cf80408b7ab..b0596b52a9fd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -312,18 +312,18 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 
 int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
-	int res = _FAIL;
+	int res;
 	struct adapter *padapter = pcmdpriv->padapter;
 
 	if (!cmd_obj)
-		goto exit;
+		return _FAIL;
 
 	cmd_obj->padapter = padapter;
 
 	res = rtw_cmd_filter(pcmdpriv, cmd_obj);
 	if (res == _FAIL) {
 		rtw_free_cmd_obj(cmd_obj);
-		goto exit;
+		return _FAIL;
 	}
 
 	res = _rtw_enqueue_cmd(&pcmdpriv->cmd_queue, cmd_obj);
@@ -331,7 +331,6 @@ int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 	if (res == _SUCCESS)
 		complete(&pcmdpriv->cmd_queue_comp);
 
-exit:
 	return res;
 }
 
-- 
2.34.1

