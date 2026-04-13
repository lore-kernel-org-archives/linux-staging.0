Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC837F75F
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075384; cv=none; b=AMXD4Uoknvankl/WcApf3xYRyzHHI+mXuAdQZ8yy4iwlm5qzDy0AQcd0rCK4hd0HnbQbUHN2yyY4kPU3SbPDc8T0Stv5axyL4/iM3BwYAPF06HxkAlwiQ4NdIC8ok0+X82Bl0wCC/WY4E48gvOEqoxXdXfaJ3+7nKOhbpN27SOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075384; c=relaxed/simple;
	bh=PBKLdUulI+4wyDp2nI9P3PFNUeySMHyOOvVbWnDw444=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCw2PLTNW6T7EPEe91PFkRhhN0hl3eVDGjOc/AVmKu3jWjwkUgNODVtPRxhmv+Uevdv9MkhQP83gkwogmunXeXv+qsGDbgUyI0cL1L29drKVXIIEP0uG2U09NPldhMXFQdKPUc9PyXGbE41yhZ2hyV0ZVe3DEotfHlZiz9GfzDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4SXxPPi; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4SXxPPi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-671ae79e617so279332a12.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776075381; x=1776680181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3e6stqMXmYaFiFCQxO4DpERHs9UT6BI5slx7/qV13Ew=;
        b=j4SXxPPinBVtI9AzCVgI52i36sa0I679KoRbB/zVWi4oQ/rbBn/44KPdh+ovrL2WP7
         cJvJURSFSpHnvMq9A0YhV6mtN4FsZcByRqIK6q2iBxaXyY0fNGnYtIjpq1YFde05cQsi
         /0ITXEzvIuMvkJxZ9gxMKVxvE4XG6lh1AoEAViqbWiP83v1P8kelIYv5Y2jTBwlrtPKN
         /ZRFQr+gtuB3KxVUzz8CGf/vMzvGVGXbyLPiYBzzkYAwgFu4pZT8mOvdQ1JqUNCACCQN
         1MSQRTJyM0mJMFqe2g6V9FXdLKlXpPAydqtQmbcnNqQteIKkezFv7WYnzpDXxtUFoC4Y
         71dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075381; x=1776680181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3e6stqMXmYaFiFCQxO4DpERHs9UT6BI5slx7/qV13Ew=;
        b=HrNJ+na1C1OwiBQzcLUBDgoSKQ700DS9MHbJjYDocfz9803gQHJUViriUAICFJ+t/V
         hYsSwlmQf7h89vHsh2ehU9YnKJAsWX78ozeeG2+toO7jEcfZUic2ll8zLWNbSc2psKs2
         ox0jdbAUWlHdnGzCSTxVK7Ub0kIkjt+xbBBd9oBC3+cPpBVy7LDc/DvV68sbXyaB4Mff
         1vw9RKFmmKxyrtrbJ1r4uJivCpHfnM1UT9cYvk93gulFPlk+NpgCO7qkksbAI1mSuToR
         P5LVKHQtOnMSvSvVJXcWwZv/0/Ev6OhODQzH+UcIBZmnnMXCTNcVn4CP2m7zbVj7LjAN
         cR9g==
X-Forwarded-Encrypted: i=1; AJvYcCWAgaWJ7yMYkApdPNColjQY51Ia82Z5YzkLgFPGnLkawHxDnakXKcwmChD3Ve1U3AWBT4r/DUWUMMD/+F2b@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwhz6yNA0PiYFWEuCmuUaljaJlivYklNUDP4BZZ8pU1LL0fAMK
	Biyz8fAL04XpQdRPFWGFBjcBifXqWHcVRs3TPKqNfWgtYEzfiF0cxuKx
X-Gm-Gg: AeBDievH80ZSADTWXjKpClibzd9ViSuCqWGyueLhZtXqeB+pAT/FfSxDI84FbxPNsY/
	+qVOXUD11xCD5pohzqtcX6Zl6hlCOA8DURFDjP4mInTYoqd1Qc2H3sKfM4VtuTtElMLTHE8W3tt
	hpB24JX3o8tEmf0ymNzGirC2MsGLuAFDnpOzkncspNzv4m8jt2JUX7m7RxKi6S8vPjPfGhiw0Bt
	MWuF2LcbWo0RKeBBAfZvduSgha5dY85Mgj2pXFyiSdXOY21JKi0UhOF956+5EMtd8VUafF4Fr5g
	D8CaxKRfwNRRZoCJBnTMYjKINJDkJ3hLyOUj2Gdn/RZbPTcW7JXBXGjVhhe+h8ujxmKQkRvGwfy
	B0j3nlrhKL9W4VqfPjdGGcIPvBzHSkJlwmlMVCzaowH/Pspvk93Wk64ZOin8rOT7AB5xFxBzpao
	FhlxiJd0q5VM5L0n/cx3dcgI5LTj/yDsGHMNwVgGTdkHsi36V4+Gdx/g7cWqVYQfpcvKt9J1Ee7
	Z0gdy6ChrKT3I1wHwVC0vK5HcZZHO9FyyU5SDfj3Gm4/kwxAylC8hm9vrMHuwVsmZLp75LFF0O2
	51o2rg==
X-Received: by 2002:a17:907:1582:b0:b9a:cb5e:5354 with SMTP id a640c23a62f3a-b9d727a0815mr506275266b.16.1776075380789;
        Mon, 13 Apr 2026 03:16:20 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5af1sm291657566b.39.2026.04.13.03.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:16:20 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: error27@gmail.com,
	marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v2 1/3] staging: nvec: fix use-after-free in nvec_rx_completed()
Date: Mon, 13 Apr 2026 12:14:53 +0200
Message-ID: <20260413101453.495549-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412205057.386856-3-hossu.alexandru@gmail.com>
References: <20260412205057.386856-3-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvec_rx_completed(), when an incomplete RX transfer is detected,
nvec_msg_free() is called to return the message back to the pool by
clearing its 'used' atomic flag. Immediately after this, the code
accesses nvec->rx->data[0] to check the message type.

Since nvec_msg_free() marks the pool slot as available via atomic_set(),
any concurrent or subsequent call to nvec_msg_alloc() could claim that
same slot and overwrite its data[] array. Reading nvec->rx->data[0] after
freeing the message is therefore a use-after-free.

Fix this by saving the message type byte before calling nvec_msg_free(),
then using the saved value for the battery quirk check.

Fixes: d6bdcf2e1019 ("staging: nvec: Add battery quirk to ignore incomplete responses")
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v2:
 - Add Fixes tag (Dan Carpenter)
 - Remove obvious comment (Dan Carpenter)
 - Move declaration to start of block (Dan Carpenter)

 drivers/staging/nvec/nvec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a56..2a3499dd4d63 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -494,6 +494,8 @@ static void nvec_tx_completed(struct nvec_chip *nvec)
 static void nvec_rx_completed(struct nvec_chip *nvec)
 {
 	if (nvec->rx->pos != nvec_msg_size(nvec->rx)) {
+		unsigned char msg_type = nvec->rx->data[0];
+
 		dev_err(nvec->dev, "RX incomplete: Expected %u bytes, got %u\n",
 			(uint)nvec_msg_size(nvec->rx),
 			(uint)nvec->rx->pos);
@@ -502,7 +504,7 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 		nvec->state = 0;
 
 		/* Battery quirk - Often incomplete, and likes to crash */
-		if (nvec->rx->data[0] == NVEC_BAT)
+		if (msg_type == NVEC_BAT)
 			complete(&nvec->ec_transfer);
 
 		return;
-- 
2.53.0

