Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DAF1BF20;
	Thu,  7 Mar 2024 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709792229; cv=none; b=K8s0xq5wcckrglFNLG6kOzDshhtXHqoU/nAedBPylGX/UU8jhrX/T5PNgxHpaQNMlGm/m9Mj5fR3wTjv0RUSlOVGZ28ZeSBt6c6bhRvfI+1jK5z0RFTJ/GuLymvNLTKyfkhMgakL6UhGNrcD8h6RVcl8+TDm9fX7cW/VTb2RSow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709792229; c=relaxed/simple;
	bh=sMpUp5uQTP4zSjLSxuC52GojBQpjCX5EdB7XWbkGAxs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZDoQfmz/XHbB1BSab0UvhCb4jpP1T/hzB/HxChX363aa5ITFcMd5vDHD79G+5kVilXBIFrD8w/+Xg9DWAmPgtOE6KQuIC074V465ymvc3NYuAt8Ekp2Mlbd7r6xk73K9PVTTsfN1924PgEkZsWsb0x8rpHQBizCl+oq67BAeMPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntueAQbM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntueAQbM"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-567fbbd7658so449337a12.2;
        Wed, 06 Mar 2024 22:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709792227; x=1710397027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Hg6+CbW+TSPoSbbF2ff/F+cNhwdIz/vvz68DbWgDIk=;
        b=ntueAQbMmmPHD3IGlZqDje16vtm+JYavYnuMLb7+WsjRYTm5YvIGllzxoyLNVys5gn
         KIWuG1/Fk1fHMyNkNq9WbjStKdlRcXlPisx4deX2E2Kmm6+e9I//4Wn5bS6+lwsm4Fgd
         9mVa3GnQst8T/OMFmysN3+mrRqp26LtNWD4/Qq8Pc0BHr3uI/xgpmd4TdBfbPYahy2W/
         HUSbxCLVpgNksBp2TkerKG3WTHFs2AzGGnj1WzWwTrJZ5ABrqX+D7FAa7DQqUZd0zayZ
         iEE7RLZdPRA1rfXPifxUiYEp6Qc2B5m3VRmJF9SQOUiOh2qCCgRs4Gmhxt13ETVHoLaz
         zZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709792227; x=1710397027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Hg6+CbW+TSPoSbbF2ff/F+cNhwdIz/vvz68DbWgDIk=;
        b=wEzxs6LsXFTXnRhFqq7STdZWL+on0IPQbSx0c+WkwEidHBecn4v6ga3t/bkP7h62hh
         WmeAcex3C1/Niyn68BN6aGfTxTB5eKQQj3aC3ATPXuNWuQz0OQaDGgSXdKKZNzs9ERG2
         0N6Iz9i3LPJLDPrMUcVsBh543gem5dLPFn0PMDpcjcAESdy9Hp7d5cdHY9ZW/JxEgCbv
         ljv5dWHY1LUsGKs+/vmKcTI8IA+zgGXyNx/9SNl68+oZsJBZ/CFaX887gTjM66kbsiXf
         5O5wLSgXx7GChKDnkp/T+h6sinO4I695yQFmpGEdOg68qsl4YWZNsKmJ5tpDN0XIDAH5
         c30w==
X-Forwarded-Encrypted: i=1; AJvYcCUUjrzq8zuYRhxhbX74WweHkYGH9twlKAd9ue+RQoh/x2ZCG9xYMMo+8a7kw1ewAGc0o7TwmpZi4brdSTCe812ewVuwf4epXw585HafH7BacBlq+snDg/Kp5N3RMvKDBCwhqMtfTCN3Cw==
X-Gm-Message-State: AOJu0YyUWd0wP4JX3tYQVZcyf058sNErnib07LtNa0Wi7b8416kYgGHX
	Djn7R6BSGu82JOrY4ksskMBUWD4mLZwwTbcDYQ7MhMr+dAlqY4HsMnc10x6e6jM=
X-Google-Smtp-Source: AGHT+IEt+jPMpt+1GuvaJESz8QKIrIdNfsEARq3Ves+OLQCf6aQoDp54AM6Dxcl4KHXZhmo4DsDn/Q==
X-Received: by 2002:a05:6402:2267:b0:565:9c76:73c3 with SMTP id du7-20020a056402226700b005659c7673c3mr12029107edb.29.1709792226550;
        Wed, 06 Mar 2024 22:17:06 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id ev16-20020a056402541000b0055d333a0584sm7715285edb.72.2024.03.06.22.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 22:17:06 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] Staging:sm750fb: Rename variable sii164GetChipString
Date: Tue,  5 Mar 2024 22:32:48 +0000
Message-Id: <20240305223248.38321-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164GetChipString to sii164Get_chip_string to fix
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 6dee95e60a6e..e568c210e2bd 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -19,7 +19,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
-		.get_chip_string = sii164GetChipString,
+		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
--
2.25.1

