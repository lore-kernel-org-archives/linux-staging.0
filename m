Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B922E3B892D
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093241; cv=none; b=FVmjnpfKN0ATAj/NXJTQ66tmWzROuIMpSlBqxr7epNv0BcOwTI+ae6Qlxmgj8qN9lvOJTsXVIDyapokI7/eOCmpDBlcQGF+jG62yvU4pIs+fpy4z/b3f8Rg3fi4XSd7vM+/8qsVSRj4VGYRl/Swjju7AFpKnotwZGX2XyV6a7zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093241; c=relaxed/simple;
	bh=6QZ4ZaXoQuBr7I3bFSF1x+T8RNR/5xQptlZ4rTb1K8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rtmu14Zmj49wpFecL0B/2U8t+MyyJPuj6NnYc6KB5h/JneLWYBEwxk3ZYUwp6awSxs+rIDLHu3ZwJCEswgZUPbXjyy2ajVgmQPVthn0GJwtFspt8wUgKbhOfybd+IsDBXt/Kv8y3WZNVDBC4ktpNfhgFUWRAnEMbwe7j2BJ8KUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlTHZ9ej; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlTHZ9ej"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6708cc2d6f6so4431093a12.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776093238; x=1776698038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLzdCqWaPSJ0EWisHYLtQ/C3+FmYmzzVJRGOCC4Ipm4=;
        b=GlTHZ9ejZKikWIinFFG3Xa373dtx5yRmzTqGyBFzLHPld7uPJ7gp+PfAZKISiOXS7L
         NZtRJViUkPY0Ct44+FNK4ugLXc3mJ0PqFic+huBUHr/9xpDg5zUC4qEdGVof4XW3QfLS
         x9fEjOfUIPIFHSpDAfV6Go+Z0Z4kJJfpPCjyRcNLb+zY0ETVMM7gOlCRnzgGIkv6+17V
         YzJW1yVu9lRE3wQgkAb3JQT71tDdNHJlNhymiQFNVXX1yyqRh9izcNxwalSiGTFOpa6V
         K6kW/zQTuyE0dFUW7/7x19eMeco/5wdjZIeyIq/bYKnHdkoggaOxTTCdeFbgWlLQUxy4
         r/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093238; x=1776698038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLzdCqWaPSJ0EWisHYLtQ/C3+FmYmzzVJRGOCC4Ipm4=;
        b=k9sRhW1+GrXgPvP/iNjSiGZBl0rEAh2iYK+LaJCvR9MGpnAIEwXevX4CdSCTgoOKEq
         BYDJLzzm5EIqtvWM2S0upGSm69RlDt8niGDE8KGvbfi9iKbzraHbaPqTPTK/lAJsih/e
         wjYjXMGkoYwRMKKJOuciaVUwWeggCAPMFkbJ5xMHCyFrqTsl2z7PyMNkyvC7pcrrq+hN
         pF8HTWuwwWqoFHZV+2UH9+NIbvWiMkVjTM7wOQC66p8KeCbR8iey/WFnoBzgpYc28piq
         KmO9+CO2IhGs8MUGOFkjx0EUR7VSZE0XqX+0xo5681z4T4pK5S5a2KRf+EppXflSpqnj
         +A+Q==
X-Gm-Message-State: AOJu0Yw7h8UMU6rdGM/LMWtroWaSiht3Ji0tWOQd+/QsjqsTbk5ibVMB
	n/R7TYZHi/TpU5xA822K9f5jy7BpQbbTwCl+qDKD4HxqPlkjyk4lIdkwKXkJ+ZhR5Q5yXw==
X-Gm-Gg: AeBDietMStikNsGZf9RJR41yu6M4QobpFz7JVYYH88FkwQ+MLqKE5ZakMudDiYG8lKk
	FYSZArmu9Mpgp8nOCUZSGqlz81HD0fA6cln6y7PxAR8p1a/EXfBwdiH8MYNcHr9csRNR4p5hCfP
	Bkriq2RlHdxeQMDu4GSBQD/MWl72QiVI0Tdk4WwjbIlygzVAC4GRL0t/sjn6WWMUgCqTwnQLVQl
	ClYwXHqOkvc+xSShq0wmdOK5ZeM1dzsrp3gxBTlyBv7ahWzRY2BXx0d8AJqmseXkU3nJ9E7zUoy
	4QFP7HDfqV5qE1BToXM58TmsOO7BV6lhZKa7VUqOJ4RCkqJDK1TssotXTq6X8DwDsR4MNLbwhqH
	h0vkW2OmoKuLftyX4KBg0iyuiUOcF3Gpr3pmlTkPW7feZGL/pQeEilpcjUV04HQniVg9lngFCOg
	D77YYajC7mFVxqEo277bfn5rx+TTSKEefrLXLMSUO+sZAntRsEphHJMbMoJtv0cx9wC0AL+n1JN
	yMdU8cC3inTHNDH82kjC1P4ramtv0Mbncoxh/bGWhdITnishFEEvs4PcfYKjlRi9+8OdCxX/Vem
	vYs2YQ==
X-Received: by 2002:a05:6402:5188:b0:670:a3f1:a56b with SMTP id 4fb4d7f45d1cf-670a3f1a87emr6294857a12.5.1776093237743;
        Mon, 13 Apr 2026 08:13:57 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671c4f6049bsm39047a12.13.2026.04.13.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:13:56 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v2 1/2] staging: nvec: fix use-after-free in nvec_rx_completed()
Date: Mon, 13 Apr 2026 17:12:29 +0200
Message-ID: <20260413151229.612301-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Reviewed-by: Dan Carpenter <error27@gmail.com>
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

