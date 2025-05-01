Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64937213E6D
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135045; cv=none; b=bB+QHyJIOZmSdM5AnusUecfQP0DAzRWAzMOfiXWdgqZFlNkqRHL8boU5ZOqr4+jaZI8bBsAZGY1UYgP8KVtBIFgp3alN0WlsA/B79eIAJCnj2lv4YLn8RRthz0zS1ul91DAWogaQg/A+FTF9vffLxNPLTw0QdVDciM6cGO3FOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135045; c=relaxed/simple;
	bh=ydEmKAhDTYh+zHzpkZ3DUp5vHv8ofBoECwVVozEpjek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kla8YEzYTS4Nj9WZhtOG0n1DakwRhZkSeBRSHKu+Djcn4hD/2EoQeBSakGGa10HNMPa8Baz1SFUHBtiwRH7jDf92pC6lbx5ca8yc3nXSSevAvnHs1PdBg231XbK6q/UX84XLBJOlaGmVzd63MHM3U8pvvel2aMUoGOlsRFSoHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrXJBj/C; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrXJBj/C"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so210116966b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135042; x=1746739842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nPoZkrvSe9jLXSHCMvJVVoDrt0UWfhJKy1p6w377cg=;
        b=RrXJBj/C2oY/3CUzJ/gVGmW1LL8wEWgxG2ZNrblU/kWt82FarFbuC+WNBJaJSX3JWm
         aq9OK63FAX8NTQo+VOdE+cpGzCk0lTliUiiB6qS7+B1FSzhw3roZisxrD9ReAD9bMX5+
         iYGa4iRRxQXzNVmW2r+sKQaz3Mc8XyoGMSuKrmz6TziwlJygRVgnLaAReGhQE7l4Zx1Z
         vi5lVBwc0nDWNZ1e4Q5GhfzZd1Q6X/5TfUU3cHXebt17H+YPkN6uMmXA6hQg+X/GFnzO
         t/hPx1DQ+49QGjUk/jXlF3tpjla8iYd+LpZPlFqIHaPaz6fy80Ypl7bdxB0w4zgZhiEU
         xzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135042; x=1746739842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nPoZkrvSe9jLXSHCMvJVVoDrt0UWfhJKy1p6w377cg=;
        b=u3C9oJe3F6GJ1CKqNjc+YHmPVkWNnqriEmfEjV98N3HMsdufojwy2ZBt8wGcjLwSts
         nhBwbmX7YnV5fnzj7qej6jLWCrDXrta4sZu1+Z+oXlJqyNGvLjooBqmRhlwQi7b/54wk
         RZBkSNmEQupRKij0tIlbMG/ydEUBgoQRWyie/m95HuYe9XTkIhh7kDGqfFkpRJA6HDnc
         q6HCYUwWnauk/38H5TeTAKUsNlHqSiSsSIeOYY5xHmH4vTIcBHVdSkKe82PNGq9NHgRY
         flnGj6eO6l7KzNovx71J+MY8wrPICaYfklJ6ly4Q6AWvef9vFZqWJzJzKlYVAPNOiYxX
         ei5g==
X-Forwarded-Encrypted: i=1; AJvYcCU4PQjSfJ/Huq8w2ImQGwnY+sUpMLcAFHBcDkU11Ny9+eLdqARSE8pVCoKsgObpxd3+HPcbVN7znCRW2Oph@lists.linux.dev
X-Gm-Message-State: AOJu0YwpIJ6ycUkju/WZm4RBqQRXQD8HOgVfwA8sjVFPpIIB/IFdITns
	xQhNhyBk9lIlfgESstRMC88nRj21Bb/HjLZaYyBrkeMd7sAm+MwEDRGizXGWjOG00fMH
X-Gm-Gg: ASbGncutWvFXrWn4Ogw+w95e7oWzE51+HU2/g6d4v8EQ9T8seFCb7lDHS0WcPV5GQnn
	Vr0oMpHMACPQYymbFjdZWD2u3qaaDxrdwStryxtM7BTXpCKuxbzHisva+brCKdvF/33TRwNaWgx
	GnASkYhhuoicY94OfQztGrxKaiBlvvas8masLGO+bPvOUwy7HnMmTykU0bCaPhQaKaKBgPfjpSx
	kkLiqmvWHxkBnaXOsLYXq9b0jlqvvR39SqLegum3Dm4C9PG7N0g/7neT1vlGEeqclcK7H6PjyK8
	YEEcdacZeJvig4oFQMS9PxfaLZJLstZj9Zhkf1z0+0/YDg75p1u4F2JUjo8MdbTqyWMQrthSjzn
	YrwUuIy+VOVwwpG+hIUisPFrKDedNEcpliYcofaLR4Fxpe9ZjH20b7r2jVwiZyhcI3jCOV739ry
	RONw==
X-Google-Smtp-Source: AGHT+IEl1eaIv3z0uUJRWBTl5Okk+6tnCoAhx7BhiHUPolVhCCDYS0ghrDyB8tO4rXLSRnsbPECoew==
X-Received: by 2002:a17:907:3991:b0:ac8:1126:ac15 with SMTP id a640c23a62f3a-ad17af8f27amr62796066b.41.1746135041414;
        Thu, 01 May 2025 14:30:41 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:40 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 3/8] Staging: gpib: Updated return type for `request_system_control`
Date: Thu,  1 May 2025 23:30:32 +0200
Message-Id: <7aaf821bdfa84f6ba1df0c197e6624f40037aff9.1746133676.git.thomas.andreatta2000@gmail.com>
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

Updated the functions used by request_system_control to return int.
Currently there's no possible return errors in the functions due to them
being former void function, for this reason they all return success (0).

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 3 ++-
 drivers/staging/gpib/cb7210/cb7210.c                 | 3 ++-
 drivers/staging/gpib/cec/cec_gpib.c                  | 3 ++-
 drivers/staging/gpib/hp_82335/hp82335.c              | 3 ++-
 drivers/staging/gpib/hp_82341/hp_82341.c             | 3 ++-
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c   | 3 ++-
 drivers/staging/gpib/pc2/pc2_gpib.c                  | 3 ++-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 3 ++-
 8 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 445b9380ff98..ae60bc674a85 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -339,7 +339,7 @@ static int agilent_82350b_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void agilent_82350b_request_system_control(struct gpib_board *board,
+static int agilent_82350b_request_system_control(struct gpib_board *board,
 						  int request_control)
 
 {
@@ -356,6 +356,7 @@ static void agilent_82350b_request_system_control(struct gpib_board *board,
 	}
 	writeb(a_priv->card_mode_bits, a_priv->gpib_base + CARD_MODE_REG);
 	tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
+	return 0;
 }
 
 static void agilent_82350b_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 6b22a33a8c4f..367b70fbb52c 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -578,7 +578,7 @@ static int cb7210_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void cb7210_request_system_control(struct gpib_board *board, int request_control)
+static int cb7210_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct cb7210_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
@@ -590,6 +590,7 @@ static void cb7210_request_system_control(struct gpib_board *board, int request_
 
 	cb7210_write_byte(priv, priv->hs_mode_bits, HS_MODE);
 	nec7210_request_system_control(board, nec_priv, request_control);
+	return 0;
 }
 
 static void cb7210_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index a822fa428cd0..ae05f5205b2f 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -83,11 +83,12 @@ static int cec_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void cec_request_system_control(struct gpib_board *board, int request_control)
+static int cec_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return 0;
 }
 
 static void cec_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index fd23b1cb80f9..7a47d61cdb2a 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -67,11 +67,12 @@ static int hp82335_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void hp82335_request_system_control(struct gpib_board *board, int request_control)
+static int hp82335_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
+	return 0;
 }
 
 static void hp82335_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index f52e673dc869..fad5cca5238a 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -293,7 +293,7 @@ static int hp_82341_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void hp_82341_request_system_control(struct gpib_board *board, int request_control)
+static int hp_82341_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -303,6 +303,7 @@ static void hp_82341_request_system_control(struct gpib_board *board, int reques
 		priv->mode_control_bits &= ~SYSTEM_CONTROLLER_BIT;
 	outb(priv->mode_control_bits, priv->iobase[0] + MODE_CONTROL_STATUS_REG);
 	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
+	return 0;
 }
 
 static void hp_82341_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index faf96e9cc4a1..233dcf40be39 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -909,7 +909,7 @@ static void usb_gpib_remote_enable(struct gpib_board *board, int enable)
 
 /* request_system_control */
 
-static void usb_gpib_request_system_control(struct gpib_board *board,
+static int usb_gpib_request_system_control(struct gpib_board *board,
 					    int request_control)
 {
 	if (request_control)
@@ -918,6 +918,7 @@ static void usb_gpib_request_system_control(struct gpib_board *board,
 		clear_bit(CIC_NUM, &board->status);
 
 	DIA_LOG(1, "done with %d -> %lx\n", request_control, board->status);
+	return 0;
 }
 
 /* take_control */
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 96d3c09f2273..324d323b4240 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -127,11 +127,12 @@ static int pc2_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void pc2_request_system_control(struct gpib_board *board, int request_control)
+static int pc2_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return 0;
 }
 
 static void pc2_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index c35b084b6fd0..62950518fe49 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -642,7 +642,7 @@ static int tnt4882_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void tnt4882_request_system_control(struct gpib_board *board, int request_control)
+static int tnt4882_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -655,6 +655,7 @@ static void tnt4882_request_system_control(struct gpib_board *board, int request
 		tnt_writeb(priv, CLRSC, CMDR);
 		udelay(1);
 	}
+	return 0;
 }
 
 static void tnt4882_interface_clear(struct gpib_board *board, int assert)
-- 
2.34.1

