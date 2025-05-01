Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493F8257449
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135046; cv=none; b=et3LCMkrGkHQo5SX/gXdCshoL6g4gow511oGwBuHw7smrAHRJ0yYsnVtAFya/dKKu0fKeMwin8X/IVIkM7B+NsDrlbVkDdDa/wfLfVzIlkhw8wBlahrvuyAypBuEaXIDl+pUQFl2u1qI7oPHkjLJfpP4tcVIHiJHbZp+CeqEGq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135046; c=relaxed/simple;
	bh=PIRMpgNUFY1ik0z+6dnUMY6vtFlnqbFG//tKiGZLUfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g49PKObEjTWX+KKgHHs1ZRiWZjS2lUh16BuOCbWEhNir+dzj9x50KDZFLfcBQukmBYZ6f1GHzxmPyDmNReygO8busoa/ZjnMxwS2c2fmsIbfLzWeA2tcCnbKEplIwIwPFOjubdr9momOid9+dnFlO+NsLlAqs347ySYQXhE35Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1zQ48xh; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1zQ48xh"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb615228a4so462437466b.0
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135042; x=1746739842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx2BnNbw+H6yRd92Qc87LVyrq8/WbAmAtW8W0e6klY4=;
        b=Q1zQ48xhVQ4LSMh1dyrBBE0sOSLBHK6oZbTrS6wDk+1dZRveRbtQWD6uI1rhV36CuG
         uzFl5L035npLxicyRsR6e0WRunywNkzgYmYfbBWHr2AUAHXOFwXfNKXK9Ogg9/tHg/KD
         t+VhjsTBJCtd8IZnozZ+ZcQP4jSuxekrVsMhyxvhSKzaKuipNHWs1vaLixmN320i0mYl
         I4B4WVRQWDDIjrUyy599o91svJX5mp8F3qH0Fxvz2z3JGtsavJRxetmVtymK0/WfX5gd
         /9uXlpGosCr+tfycrDU93kza2djqOxZEBAzp5LXJki+ybl8xQbPL3OKjRO52b3itx6md
         lCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135042; x=1746739842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx2BnNbw+H6yRd92Qc87LVyrq8/WbAmAtW8W0e6klY4=;
        b=quF/vlNcpcBVkfAVxL0gtWyv7Kk+cqh8OoXSJ8t29QbiMP1g7lcI7c6xwruOmLFhvP
         9qvcD0dBZXGs6+PZP70HIT5aZ2pdFSNZBfE2oC7G7SfI7+8ixcVEmmw7jV9iELuaRdyl
         g/WkwJG0S7bejWoGULpWZVrTQjkw/kLAYVG6o6WQyV9GOMGgALQ7DDtulkYR0hUk+nCb
         IKf3kLPGlaaGTPne9YlWtVzMZaZRllGidMdKdImsR9JkTAPOuqWcrB8uZrS//VM2UPTu
         kXQFdXyEFQSYba4JVCNwYdN1P0Z3d+MpwMopNfwG4dnDZ/bRcjATS19jD5ZIIadFzvaa
         N+ag==
X-Forwarded-Encrypted: i=1; AJvYcCUcLa3vXn0OZyoIFJ3A5cqNrNvJeaPwrqEQUzFHJfEdR8kcxlTGqfKOgxfHmhCAIMdqt2l87Lkoh/X+uIw/@lists.linux.dev
X-Gm-Message-State: AOJu0YwMTNgIUg4Q1/jG4sotrBr+E4ZYnJEp08Fdw0Vbnf3gejnvo5yC
	q3rLmsTgxq4sh4ej34HKPtX8WGEO9ydtDW4CQl+wIboNPuLsTDxQNusq34+JvV1XAeVj
X-Gm-Gg: ASbGncuXTtBCA58HaNY4hvyTB0+f0sgrBAfiPfQRYSC0woM1KjkVTI3b4BqBOZf5n27
	A4gkdkFS4d9NsVJoroOnRFmel1RFLe/rSf9kmJWgK/IAqxjUoKnBdXz62wyjbKODmsdGLggWbtL
	dF08njEtep2Kzu89ncXpgWqy0vjZhpjmpUdJ/3Et/V9uI9eaty7u2rKsyPwXYPC/ft80HLF670s
	q1bgVzBdMIsUvTmm2/ogCddcxAZDqcO4mGcay6Y//CC4CRb77L+oHS5l+IeDKZ4Mg8RZVz/Mf8J
	HNly8kGMH8qZPIQZZpaqvDtQXHPPQSZs3AbtHrppLH23+MmC9qqcwpPtBOVre2+PhDUGkpJYFuV
	ZR1SLom7Io0fqThXXSBe7LvnEkMSCwJR3j6QCz6nsZlcArSBQpmBD8sPMP6mAKjO9tQ78pjOeXP
	uy0g==
X-Google-Smtp-Source: AGHT+IFUJ5z+Wf6tRCevsNbth9+n/iTFmf2xbNXBAm07ufdrNRRQKVTPwyzOkjqVkNpgNVJZHDRMRQ==
X-Received: by 2002:a17:907:1c0d:b0:abf:174b:8ca6 with SMTP id a640c23a62f3a-aceff056cd2mr321833866b.27.1746135042337;
        Thu, 01 May 2025 14:30:42 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:42 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 5/8] Staging: gpib: Updated return type for `ines_request_system_control`
Date: Thu,  1 May 2025 23:30:34 +0200
Message-Id: <226a7f00f7a5a332808aa4d058b000deb5b20c92.1746133676.git.thomas.andreatta2000@gmail.com>
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

Updated the functions used by ines_request_system_control to return int.
Currently there's no possible return errors in the functions due to them
being former void function, for this reason they all return success (0).

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index d93eb05dab90..2ca1b8659ab4 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -441,11 +441,12 @@ int ines_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-void ines_request_system_control(struct gpib_board *board, int request_control)
+int ines_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return 0;
 }
 
 void ines_interface_clear(struct gpib_board *board, int assert)
-- 
2.34.1

