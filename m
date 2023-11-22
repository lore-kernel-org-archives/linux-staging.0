Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138873D8C
	for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gufclX8r"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso5706277b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 01:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700646124; x=1701250924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SV/osW0R7bVpYMTd62PKwIsgqxKMwJ1fiVW5wV1ilHs=;
        b=gufclX8rSPTnbbDa3xbJ90nDyEQ1ScoFAiw6zuaIkWAR3tKgTIh/o01xkSxpPK1Nhk
         ZC81z7Bdi5V8PNKPGVAyiOu3nwc3VCD7wdeGwnHaRZQIZziwJ6nkjqMOJ4hV/zko3VaF
         JmDBnMPMXM5ECovPz7O7tgeODpsXUH63IwO6kGZLQuXGSeRtXEuUZGWgGaKMgROXWGqy
         CjNtiCFwLITXEqY8csbKUs8EU2H4ImWlyOMFcD5LJAukcd3vIc31DmJWrl4vVEjJI7cC
         yjirxTMHihgAUv/gunTMxch9B5gjM+t6lR/fvRFe+9dq24jfpSU6ISdjeAukT8d+Tvgk
         nnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646124; x=1701250924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SV/osW0R7bVpYMTd62PKwIsgqxKMwJ1fiVW5wV1ilHs=;
        b=iUcaGxGxtPMv58Y5CEd1frMcIuGitNJ9ER6zZnGpS6ezbtZYeOaxBZQ3QZT+cmmVFB
         XKqT1mq+f8S5/LEp32iVwOlAnusLfA8lozbR9PsEBKmuB+0OVXWi0wJSz8GRrUUcPeLA
         GoeDl1l/afAm5PDhdKIcLM++W7ufGhCQmHKmLny5UZfYGoVOig+5etIwsA7iVYI68jgR
         Jyk2xvMNLOOd+C88zvaTZp3lLklBadgPWOi0TW8jsX/5lQAMKgP1QpF9iHIfFuGLbnyi
         ZrLR3UMoUuzf7djIbAcQC6sAI1NQcNpfDMwmBERcsV0+nd9fYfMAtRBuRbNG4iM4dQ9j
         BN1g==
X-Gm-Message-State: AOJu0Yydfo29oPgF+9t3+U9KDkSgCpqw0mtfRbFu8VpBPkhcMzoNu+nd
	YiT9C3v0DC5Q2fhSS1mMRTQ=
X-Google-Smtp-Source: AGHT+IFzf3ahprBjT8RgnY9ilotsSVvN6c0RYl7tlZ7ISOBudnHGIt779Lq+6/qdV5RVMMvH2vuzGA==
X-Received: by 2002:a05:6a21:338d:b0:187:c082:3e35 with SMTP id yy13-20020a056a21338d00b00187c0823e35mr1917336pzb.14.1700646124312;
        Wed, 22 Nov 2023 01:42:04 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id c10-20020a631c4a000000b005b82611378bsm9144852pgm.52.2023.11.22.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 01:42:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7F5CA10210555; Wed, 22 Nov 2023 16:42:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Bruno Moreira-Guedes <codeagain@codeagain.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Martyn Welch <martyn.welch@collabora.com>
Subject: [PATCH 1/2] MAINTAINERS: Update Martyn Welch's address
Date: Wed, 22 Nov 2023 16:41:55 +0700
Message-ID: <20231122094156.30642-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122094156.30642-1-bagasdotme@gmail.com>
References: <20231122094156.30642-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650; i=bagasdotme@gmail.com; h=from:subject; bh=v5yUaK/fxsxugJsKLcf76rnii+QRaf0Iwcy7KBtjsIQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDKmxpx8L/f3/7fy0JeL3Ch/eDRTgnbDttfJtIY7/JzPcS 2VU2LzmdZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAinL4Mf+WO9N+7KXs90Z5X VHr+pozMXfemas7ifzTLUUKJ7eKtphMM/5MDjnbN/sq15BGXCXdSUtaWP61RO0XcbxiqHpZOaRB O5wMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

He is now active on the mailing lists using his Collabora
(@collabora.com) address. Reflect it in MAINTAINERS and also
add address mapping for him.

Cc: Martyn Welch <martyn.welch@collabora.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Martyn, if you still had like to maintain VME subsystem, please let us know.

 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 43031441b2d922..1df03996c73bdf 100644
--- a/.mailmap
+++ b/.mailmap
@@ -368,6 +368,7 @@ Mark Yao <markyao0591@gmail.com> <mark.yao@rock-chips.com>
 Martin Kepplinger <martink@posteo.de> <martin.kepplinger@ginzinger.com>
 Martin Kepplinger <martink@posteo.de> <martin.kepplinger@puri.sm>
 Martin Kepplinger <martink@posteo.de> <martin.kepplinger@theobroma-systems.com>
+Martyn Welch <martyn.welch@collabora.com> <martyn.welch@collabora.co.uk> <martyn@welchs.me.uk>
 Martyna Szapar-Mudlaw <martyna.szapar-mudlaw@linux.intel.com> <martyna.szapar-mudlaw@intel.com>
 Mathieu Othacehe <m.othacehe@gmail.com>
 Mat Martineau <martineau@kernel.org> <mathew.j.martineau@linux.intel.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index ea790149af7951..a02aa52fabe14b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23234,7 +23234,7 @@ F:	include/linux/vmalloc.h
 F:	mm/vmalloc.c
 
 VME SUBSYSTEM
-M:	Martyn Welch <martyn@welchs.me.uk>
+M:	Martyn Welch <martyn.welch@collabora.com>
 M:	Manohar Vanga <manohar.vanga@gmail.com>
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 L:	linux-kernel@vger.kernel.org
-- 
An old man doll... just what I always wanted! - Clara

