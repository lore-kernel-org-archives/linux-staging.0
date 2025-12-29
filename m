Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445F1308F2E
	for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007630; cv=none; b=bPKglTcogdTmmRlFkaQqcB6W7EBiL+WvZyB3kiVQRLD926ID0kUOJVn57zuTLHMXN+fEu5M/aVF/ZgbgI4rGOE/ezh7Ew93RtZb1qCDlxClVWOZAqM1piOgxy+qpz2z4TsZnwaiKM+0WoMzREMCCQD6GCN/62vuvXtQ+VAz3uIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007630; c=relaxed/simple;
	bh=/eXfD9Evtr+8HgXfuVEHShd7F61wHctm+R0De6BI+qI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K84ipxpYYtRrigsnVgqbnjbTOxqXZW9ZQIw4D4cKdmjfvSGSLo1Ik8sJ6fjjaBatobPltrGCTJtMaU4nQickdNvkFGWzZNbVqCX1oStbC95fEMRG3WycWR8pjMmdKwmlY8hFoaqUKEau+VL1i23ehRaeNeZCvSdyVEzcK2DK+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVRcrByp; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVRcrByp"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6446fcddf2fso7694139d50.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 03:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767007627; x=1767612427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XgScvzkqEdgsYl2Q1d0N1QNErj1Sjl56PoHvBkxeLx4=;
        b=lVRcrBypQ3R8cgWRoDC+z5DQL0By97z07m1IBI8mKHdsgGle6Hd5xlUfdEHAMj7OZP
         1Qu3RfKPEtQ598+iBb3KsAD5LiGbAurYOQi+oa2cNf6bDxp3c1OYrQzYchATCNft+LHk
         zLUbXHqFSD4DgunxfSxOUzk5FcXqAzrQ7ui9mvaP0lRTtKmml3TND8XUg0EuVgX7y20z
         4od78R3dtwkzrkZU0jiTvN550ogJ7+yEnonKcl/wN+Crs7BKyg1c41jcCr4jxypl61Gn
         W6lla1JrSmPhaeYwXMvnb6/GBtXS/ff3R1rdWHydtCc4GX2E8Ngvv11L4ttqxDIe/R+h
         LNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767007627; x=1767612427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgScvzkqEdgsYl2Q1d0N1QNErj1Sjl56PoHvBkxeLx4=;
        b=rlc4NYJBA4NpNWZTcH4kwDWsqpfGv9DlMXCKXKCcek3+0J/bcMWnyTI+40m4jDbkg2
         ZCEd96DR+EdRSawQptZoiBCEVL16djzL8cdiWW8IXWvSm1nqF4Ehbwg5+v1gF8T+zdJP
         2D4Gfp1cK5wisD+5aah+79yJAQsQ/Z3UoTwxD1nfX/Bl+ajRBCiLHsxRoPj2Jx35CdAW
         lVrVhMIbKK4ZhRbPBzGfwzSWICb2il22ZXrMOwQBPkrpGoBtmy8017jAUF++pN7G1rWJ
         kWWCMlwxl7gVg/GmX1wD9yL28eHmI61OIGqoTMXCtP2LLS8p4RlxbE73DLWnoKD8YJXa
         hKpw==
X-Forwarded-Encrypted: i=1; AJvYcCUTTaV154T1+L8hN2PXq4XTwKkfG9xvL+vn/FLUsX3GjJLTHsvrj72W2ba825Kio4xxdEN+fgQqIpnfwx01@lists.linux.dev
X-Gm-Message-State: AOJu0YyIb51dBma1VYrn4+5uwmbn66p5cfguWY6oPMYn5k7qtlzL91z2
	zACRTmbRnXL7Bl9zJSeIbkrE3uOhgqYtgrqvEC996zXmhHE/lAma0VOd
X-Gm-Gg: AY/fxX73ZrpLe2gWznkQ6qw6LK/C+H9b4AFmIoR8t/uy0RuU7x3MstJMPBmYJXiWpXD
	cK7vu0oWuOIKVtoTj/AFVqMA5cznZy/dN4M8A49r66n9xGhnkBTmx5y+oQLgj8/qm3H5NgzQ5jY
	U4zOunCtD8bJIwoeiFDAvNwttzxRgA0+++kY0+24ReWcMbVNyAipMohNGTrZ/j3fs8yKp9JbPVu
	aO55oOFe4tfKxMig673nDlTYiG8Y4aDjmpGokYGIqhj4U01MSVE0NE61V/1FQ5ISeLy4XTyAX4S
	XOUscd88bF/H1fJzPwg20ybwNviSN1OG9/xRh0SNaABpOhr0esfZHdeTNPT1+rVU2jmqMZG+PFg
	jddNHTfUcKvofnFf5FUFFiUfWRp6RbcSFpxQ5L2jgyhI09Dppu6DCnnCC22y49cC5ngEWaNklv1
	Kg/afW7iqz/z7vyOYnh/do5OU3jwfFlfSP9UVO4hzvLvVL79FIyxZv1jyAU454CfFnGqs36uTKI
	03IYiw=
X-Google-Smtp-Source: AGHT+IHh+KheJSeNBvKevAwul2oJFM2yzR09vpWgFyIeYNMQzMX5iyx602UjHQsOnBZYK+L3I/JZ+g==
X-Received: by 2002:a53:bb06:0:b0:643:2169:d6c6 with SMTP id 956f58d0204a3-6466a8390b2mr20424590d50.11.1767007627207;
        Mon, 29 Dec 2025 03:27:07 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a92c602sm14634212d50.17.2025.12.29.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:27:06 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: Mark Greer <mgreer@animalcreek.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] staging: greybus: audio: avoid snprintf truncation warnings
Date: Mon, 29 Dec 2025 19:26:49 +0800
Message-ID: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

W=1 reports possible truncation when formatting widget and control names
using snprintf() with a %s argument and fixed-size buffers. Build the
prefixed names using scnprintf() plus strlcat() instead, so truncation,
if any, is handled by the string helpers rather than during printf
formatting.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..4293ab899390 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
+	strlcat(w->name, temp_name, sizeof(w->name));
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
+		strlcat(curr->name, temp_name, sizeof(curr->name));
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.43.0

