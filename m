Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC415ECD7
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135046; cv=none; b=MyF69WzMNFQX9zGawLKalrfsd/uVeEjog83jYptcmLGBThAll+ahlDAhfJID6MB5b7RCz+kxed23MTd/9izdYjmIsysqeCcrO+StElapbZLaB8q5f02SqGeMR22ZBs1uIa//2WKX1GJVE40KXst4kOu+zQ/7yZ1OO0qKsnF4f20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135046; c=relaxed/simple;
	bh=WRHPFkMvhTVOHzTeZ4uUE9Rh7DS+jKs9WFZFam3kfBk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tkj5R0JZNhRLjCBu7p3JHEVmrJipVhvhzybVzAMjCegaf5H9/qNYXrV0VLbJ/qGeUpbjafs9eLDBjhe9TB7V7Z5vGedz++ZMqFtMmdg3GS5WRdE+LJQCorMWtJa2/Bzaej4MD5QSIWa+skTqqWSPLxxEyjU79DlcQXJpUkbcu6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzJ3/6go; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzJ3/6go"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aca99fc253bso212817166b.0
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135042; x=1746739842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKyg0ozNzm7//cxSIfxO1lKoXW2Qa2IHKu5mo6o02A4=;
        b=JzJ3/6gohUO65DkQqEcQJ0EJwdoc4FEBMpxsOMLy9mKjo/7MqjXVAXf54khWI1wbuR
         yWRC6v2jn70kXaGwReKDw7peHKsYkhDKlK7JFV6gdmkYPbsv0KYs3hcF+UDYb6ZJfAu+
         6dp60TfVTi2tP/dyvj+OodUpCDyBJrNiCb6dZTABREfK5/gHa1h78D8q3wKtEts4BYNU
         GgUJpxjXUNeO5/BZkaNOhuzIhFgvDT2MajxTsf4AFylYYk+bjOEPjGwLLe254o7RACvC
         5bHU8blcMTMMMF0IHmDJAHj35FV/vjE4V4t/bgLYvxa3rP8T0IUz23u6MO1gfHpNilkH
         kcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135042; x=1746739842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKyg0ozNzm7//cxSIfxO1lKoXW2Qa2IHKu5mo6o02A4=;
        b=m6KLLj90uN+F6W1a6kCSB6Imkbameqgi/tI32/RxETpHXkkFEZZBOwr7A5GqbV8wB5
         b8wJDzCbu5f5wvGqMwdsHTXv003v7XtuH9eiPws7gnmnt7ZJFmc409bo543P00ugeGa9
         ez157EIPbAG6VQE86SluLtmfU6QHUBIoHC6bVQgmnMPR2EB3Gy4YOMD4c7MGq9g1QIwu
         xs+vTdKXueU8MrWMf6zUzYE3lazw7XXFbP2i/O+fGNcBfG479+s2KCNRcq1xSvANVMlE
         hLKVsSh750h69UJZPVtFg5E7QVW7NpH2Q9qHCe2MmKzf5nu/UwO/z8FU2YmBeVm859la
         mJew==
X-Forwarded-Encrypted: i=1; AJvYcCU2iOpifuIOnxfWeAFQEaDnWvL3oW2Jps2jYuOAjLFwQxgXtA3DRWNi7J4nXH0IEnKbiN+ehxMmyvDI88/q@lists.linux.dev
X-Gm-Message-State: AOJu0YzeTrNWXMIQt3vJxLjomCJgLlNSMXZU8qlv4u6bFIVSfn5pvMST
	qkJ+7AkkQy0QmF4gbA86Sy35/3sCkJpfB9fe319eO+M4YLXYdiGQoDFY9DJ1AawokQUT
X-Gm-Gg: ASbGncuPvWXKMwzNRgpzZaQHMFbRqQn3B0DalQjQTLaoYOGx0Zo0KQ2xJDyae5sMiJz
	3Dt8n3HLE2PRKrVVaVsdFiE0UOfrsUIKlQaT888QD/K1+ch8RZ0W1cUtvzv0Bmk63i33ytw3VQq
	e8MgBjz6V2wOxtIWdQ/wQNOup8XOsdmkOEokzp1sFqCnGWND62/VfDz7+Shy1PlFjlNoaAM4HHm
	NOtxG5JQKKCuLqw/apD4XRyzlGB/zgr8inM20P769GzsFE8AhwE9yosr4m0QSqOvea9EDDBAWgr
	0rt7c61fPKrmTAI+4wBBnRPu/xxBgyysn4DlVuFaiMiC6jRy4MIXei0vNnlSWR1vIjh7xnEivIN
	LxYYi3eZMkcZVxd6HkOac527dCyFubToRqxNZcsCQLb1jlyGYSKIQwcDUVHgCpipDJ2EAeck1MA
	yIrA==
X-Google-Smtp-Source: AGHT+IExT/aJg9WflitW+HrLoVfCe6NetKKbdMQo2X2dLvCty6EdFqJWUP+btRX5BimHTUasCsz8rg==
X-Received: by 2002:a17:907:9719:b0:ac6:b811:e65b with SMTP id a640c23a62f3a-ad17adf4cf2mr59008166b.36.1746135041895;
        Thu, 01 May 2025 14:30:41 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:41 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 4/8] Staging: gpib: Updated return type `ines_request_system_control`
Date: Thu,  1 May 2025 23:30:33 +0200
Message-Id: <9639f86fd160a5ea49f12d4f18da2c599d59e701.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update `ines_request_system_control` type from void to int.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/ines/ines.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index ff27f055a0ff..a82b9cd93129 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -46,7 +46,7 @@ int ines_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
 int ines_command(struct gpib_board *board, uint8_t *buffer, size_t length, size_t *bytes_written);
 int ines_take_control(struct gpib_board *board, int synchronous);
 int ines_go_to_standby(struct gpib_board *board);
-void ines_request_system_control(struct gpib_board *board, int request_control);
+int ines_request_system_control(struct gpib_board *board, int request_control);
 void ines_interface_clear(struct gpib_board *board, int assert);
 void ines_remote_enable(struct gpib_board *board, int enable);
 int ines_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits);
-- 
2.34.1

