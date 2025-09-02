Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DF52E6CCE
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797565; cv=none; b=UtIFhieqbwkl5mgz1Ln4p7+sQsjYgpfKWtO4KLPz0EMLOOE5flwW/60W7TMXTumfep514BGUnW1O9hO23/3bbp/K6xtTRJkn08+6xrKmjDRu5EsUtvG8QxyngAowKmDRBekoQNbkVyhtw4pMgzYw6q9WgFJSBLHBViOqNp9pe7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797565; c=relaxed/simple;
	bh=740BcyIhKfKfRRxyo0ai5JUQmNTeZhlHh8EQv6Fx4lY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hGdJJ2KsluIrPZkNXVX+/DNW9B1U5OccYfjNmw2prl2yCM8/lqlj1T4XVW6BonxY7BUUyZUpCk6AI6lOA34z/gdXtYAJn7nqtYUw2L7WrxdfMe0N298kcQKNN6PSbhfwVNpowrNYcjT3+0SV1dvKq8lpCMO4/1jAifXYEcCFDeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MG6GrJer; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MG6GrJer"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-61e9dd3aac8so2267239a12.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Sep 2025 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756797561; x=1757402361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/K4EAZLbBVfhRbNqsGgmHLXOOZw/G+x8hknE2VHBmo=;
        b=MG6GrJerPu4lJpa1HUpki1H5atUZ1UCN7HsOEjPivlcliYOeo0+AblCyChb6sIfCS7
         Nc0pJAuiSCysKGmZXNltsK88YpzRXRtqdBhXA+9hLAtDmzawJvV0WSqBWt+BMlMPdJF1
         US2RRqwSmV8/i+iQriQvoIkWtMd8Nq9gE5uV3fK9NGHn3a7J8MdQR2mvN9+8qDouBRdX
         +e912LDCpygcb+M3DlRzJF20OiVvXLt52gCYhnBFJqkfBmScCOTgoMYZN7BEdLBSyBeB
         HVL3etX16Uw1f1ZHKHPDawIG95JgTc47pb4rcLoy629ZORrYvGla6UmjVzgvZ/o2rkOJ
         0LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797561; x=1757402361;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W/K4EAZLbBVfhRbNqsGgmHLXOOZw/G+x8hknE2VHBmo=;
        b=hYQ7p7kNxAKXv89opkHSIWVbUOJ3g0PeGk2GElLMd/am2pwIck9Ur9cuDqprj1bim5
         Sx+aOZgnNq/J+pQxlAHNi3oyncQrKb/d+gmhhE1LNsubs9U5lg+lDIeOfok9HTbVM0iO
         TaJPvrFD4D6ImT8HUvgYqiHvzlYsl3HqofKvgXj1A89dZOy8gSyXvbn/+HuvNuM6rm5O
         kb9iLmqS6qvVJDOfHFSDMMA964lwIBEm1jqYh154aJitJMc5rUAxSHFbpG2ubdxnMgib
         gsfqfFEhIFm30CeXoMGs6PzvZVHQp+uXx+1mGypetrd1O2hTTWIge5ToWsg5Mq1jjgyE
         KJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhQ1kqTUtdmIuXDBXNP+OCTeAEjt5PNmpEzMHTWy74OKmT/NF19ydMe85aYrQlodZ82Xa+ne0bJnwGGay6@lists.linux.dev
X-Gm-Message-State: AOJu0YzCutOGcoWKYjtPrXd/3hKWLw7z3K3ONgpR33X0toTkd6+leQFK
	K6Vie+QUGfb14BMNwJ6ay6vvNFoci5sZ2RFxgUUOc/7FCZlTcDxfya4Mmo9zxwzWc0pmkIuak7f
	dXqBR6vP8Pw==
X-Google-Smtp-Source: AGHT+IHu2RMCHU3NLYzXEdHLc3fvO1cupuIIfSxhMcWwMgEIP0sFksi/5BBq6DCJB2k0Nf4r8SmzBphWIWRX
X-Received: from edbfi13.prod.google.com ([2002:a05:6402:550d:b0:61c:5514:9cb7])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:90a:b0:61c:e9b5:74af
 with SMTP id 4fb4d7f45d1cf-61d270e811amr9136642a12.36.1756797561020; Tue, 02
 Sep 2025 00:19:21 -0700 (PDT)
Date: Tue,  2 Sep 2025 07:18:47 +0000
In-Reply-To: <20250902071847.2330409-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250902071847.2330409-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250902071847.2330409-4-abarnas@google.com>
Subject: [PATCH v2 3/3] staging: media: atomisp: Remove trailing comments
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Remove trailing comments in pci/hive_isp_css_common/host/vmem.c.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/vmem.c     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index aa67638a09a5..547cc480c105 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -161,7 +161,7 @@ static void store_vector(const isp_ID_t ID, t_vmem_elem=
 *to, const t_vmem_elem *
 }
=20
 void isp_vmem_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_elem=
 *to,
-		   unsigned int elems) /* In t_vmem_elem */
+		   unsigned int elems)
 {
 	unsigned int c;
 	const t_vmem_elem *vp =3D from;
@@ -176,7 +176,7 @@ void isp_vmem_load(const isp_ID_t ID, const t_vmem_elem=
 *from, t_vmem_elem *to,
 }
=20
 void isp_vmem_store(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_elem =
*from,
-		    unsigned int elems) /* In t_vmem_elem */
+		    unsigned int elems)
 {
 	unsigned int c;
 	t_vmem_elem *vp =3D to;
@@ -192,7 +192,7 @@ void isp_vmem_store(const isp_ID_t ID, t_vmem_elem *to,=
 const t_vmem_elem *from,
=20
 void isp_vmem_2d_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_e=
lem *to,
 		      unsigned int height, unsigned int width,
-		      unsigned int stride_to, unsigned int stride_from) /* In t_vmem_ele=
m */
+		      unsigned int stride_to, unsigned int stride_from)
 {
 	unsigned int h;
=20
@@ -215,7 +215,7 @@ void isp_vmem_2d_load(const isp_ID_t ID, const t_vmem_e=
lem *from, t_vmem_elem *t
=20
 void isp_vmem_2d_store(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_el=
em *from,
 		       unsigned int height, unsigned int width,
-		       unsigned int stride_to, unsigned int stride_from) /* In t_vmem_el=
em */
+		       unsigned int stride_to, unsigned int stride_from)
 {
 	unsigned int h;
=20
--=20
2.51.0.318.gd7df087d1a-goog

