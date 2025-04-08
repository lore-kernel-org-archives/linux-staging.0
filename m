Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204625A2AF
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151127; cv=none; b=KCZV+EA3O8vfuPrvW6Y1g7IlydxPEbiuYAkZidIF0Rl5oILuEBQueSWF7X2xjESinqtebu70VMNasVLEXXlTyVeamlc+Sm+6oK20WToc6hQU6FDiB5420BfeTmSrGl/1+l5Q8li+J50PgQ4xk71XUn3aPdnCV2TKjCvH/q1lC0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151127; c=relaxed/simple;
	bh=mpMwcjyONGIh2W3fVzcXGp1Kfrhk7hvQoz9ErvoRi6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF9vZKXqcCNWhFJtSYEaJkOSRX0LaxwW3Yq2Y+FIyqq2QOxODyc2VvhPXqoj2KNaFUYJLtU0QyGSwiWf9n54otdlgSJEbo9dj/N/AxesuqROaoZ6h6F/eXyhh5L++y/4D6tlWrKlApwsm75FXfjfQyR59YpEojP80C4c+YCNWdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=FmjNet2J; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="FmjNet2J"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736ee709c11so5125565b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151125; x=1744755925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6YenbA8rChcDXkNNV4VK3Kvq4f7lRGg9TAK9we71Y8=;
        b=FmjNet2JH1UhVyhCXRQDpQXRojHXcHQEbSU1HPIoU7SjoMARi3a0321LwxbNbYUTup
         ZJggQ6ILN57cuyT8DEvxlD9sSd5lgr77qwwvYA1ip4/h/4GpHhUsPIHnFzKXecYRXsBm
         Uz+w7SgiE2UWQZ0FVArA6HF0l11rj1IUI9sEKpbHKelda6dpuXRsruXhrdHWfi2BMLuE
         Ik33I1a/NPpMa1DjBhdiesqgQXTNMi8cESvwAoyPTsmQ8KFu7s+olcNYWNHgqyvVmQ+E
         CGXlqAjHwps9zbJoGqqvs4IYT4A5OGSjvI6urU/mM96zmh2g883rJABmbRf0QK/sVT5V
         qtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151125; x=1744755925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6YenbA8rChcDXkNNV4VK3Kvq4f7lRGg9TAK9we71Y8=;
        b=fnBgp2rxbGkBpyhRyg0x1Z4KN+vs9jw5N+0Xv9KW9hi8XSwFvpWghMJ2rbBANAzXFv
         viQFNFtJepfbVe3YtCTN5Nj2S+YOf3dtTT/Cnm50gyZGZ+skP8DNSU5EcokxgXLhR3Np
         EXS5Vqj6l+H3mxSfhiK+XAzF0UMNSaaoVlqI5qfJAaTyU0hmTWl3rusUeRnn4AU2wzHH
         vSfkrzv2PtTGmHSVzK8B+ZtmzmtKDqdIINmsY1Y3X8Z/RSeYO2mHjyme7WpAsmsh/IDv
         t91qA24cKZZ/6G0G2XcaPUrna2eu3WM2DWkOP+ncLbYpHxwt329gg2gjTX21YHVk0eVh
         aO0w==
X-Forwarded-Encrypted: i=1; AJvYcCU2a6lX5qrGvtptm5+co66KOW+xojraXTi0N5tUBTkSHSpzrOFNeKp3AtRhcGgUQV8hJFoYumx3bhggJmTV@lists.linux.dev
X-Gm-Message-State: AOJu0YwfoSk4GNYHDxD2ITmQHbYfeS4KBJEyqHpVFDZe0q03LFdzIKaP
	dOtlVQAl8QLfjpA29YA+rHTRvIBnnYjp6m+dZRbJ3TAG+wj8IkAwdWZ2rGWI0Q==
X-Gm-Gg: ASbGncsI+yvTyRx3FMDSh/B4Y19xoVZJ6GUiEj9Ok4vnwzOQwtOgveNAWGi71rjDxCh
	qznKeWX69O8ULAg+GT8tkbWxukkf4AObpYCbDR6npMMsSoY7LyxU03WM1u5chFb7GyqiJI3+wE9
	KJFahH52CBp0dWbHp1nK92/A+tOTQfBa2nbV+CLLQ+kr8YFUynLpvTS5wupAEPZ3Z0B+z4X/iZd
	OWnkKi1/KRjSt4+SAGqGAu6XW9syi6h4SzjcpjAUwHWc6d3i9aqLWOwKz4a7FuJUBlHEjEm99qa
	EKm6KC+ElVp3DWEuIdahi5bYVMMpXQfekWX+hjvKlOKB2t+bGXhIX4X7zdJYh706wAobO16br1S
	fD0LjmfzVeQ==
X-Google-Smtp-Source: AGHT+IG+i9FqESkEDkmuuTUSiEQCuG7Ql/F71HjHIc2UYj78Q5uhMp68wFWb/XNYqyLoS71h+/Argg==
X-Received: by 2002:a05:6a00:4c94:b0:739:b288:13e7 with SMTP id d2e1a72fcca58-73bae527674mr835294b3a.15.1744151124687;
        Tue, 08 Apr 2025 15:25:24 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea09a5sm11572528b3a.107.2025.04.08.15.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:24 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 13/18] staging: gpib: ines: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:59 +0000
Message-ID: <20250408222504.186992-14-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ines/ines_gpib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 93897088f6f2..7d53f6592845 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -539,7 +539,7 @@ void ines_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t ines_pci_unaccel_interface = {
+static struct gpib_interface ines_pci_unaccel_interface = {
 	.name = "ines_pci_unaccel",
 	.attach = ines_pci_attach,
 	.detach = ines_pci_detach,
@@ -567,7 +567,7 @@ static gpib_interface_t ines_pci_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pci_interface = {
+static struct gpib_interface ines_pci_interface = {
 	.name = "ines_pci",
 	.attach = ines_pci_accel_attach,
 	.detach = ines_pci_detach,
@@ -595,7 +595,7 @@ static gpib_interface_t ines_pci_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pci_accel_interface = {
+static struct gpib_interface ines_pci_accel_interface = {
 	.name = "ines_pci_accel",
 	.attach = ines_pci_accel_attach,
 	.detach = ines_pci_detach,
@@ -623,7 +623,7 @@ static gpib_interface_t ines_pci_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_isa_interface = {
+static struct gpib_interface ines_isa_interface = {
 	.name = "ines_isa",
 	.attach = ines_isa_attach,
 	.detach = ines_isa_detach,
@@ -1215,7 +1215,7 @@ void ines_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&ines_gpib_cs_driver);
 }
 
-static gpib_interface_t ines_pcmcia_unaccel_interface = {
+static struct gpib_interface ines_pcmcia_unaccel_interface = {
 	.name = "ines_pcmcia_unaccel",
 	.attach = ines_pcmcia_attach,
 	.detach = ines_pcmcia_detach,
@@ -1243,7 +1243,7 @@ static gpib_interface_t ines_pcmcia_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_accel_interface = {
+static struct gpib_interface ines_pcmcia_accel_interface = {
 	.name = "ines_pcmcia_accel",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
@@ -1271,7 +1271,7 @@ static gpib_interface_t ines_pcmcia_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_interface = {
+static struct gpib_interface ines_pcmcia_interface = {
 	.name = "ines_pcmcia",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
-- 
2.43.0

