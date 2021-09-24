Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F62FAE
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:11:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d6so31056790wrc.11
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67Kcuzs0YKpXx88WCjEGQzyrzMHeJWwzbYlSdV9bf6Q=;
        b=h++tGSSgJhBX7tDiNX6Qqq1hm8PKJWrjVafbvKhu50yYJ6rEUbg3p4gAHWFhC/E8/c
         xaiBw9Ws3BhFR7l/v793m+fIDjkH1AyGmGAdcwGOmhvug1NP8P9qdI5NGAnR9wpq8X9u
         x0Efg42zNIXLzwCcdIWBEaEicvmQyFlCGAVdaHUuayJTuWVlotxhtFXxX8vtV42tDkZd
         7hzSuC1DPrkFPBx3vadA+gepFVTx4X0mw4Rm4m294Fj560McDuqoWxH42qOxy7JcRYn6
         MUK2XSSxWyFLuRbFBevkl87pROqVo14o+AHTi+OS3CT/x49wDn+uTF3aJuQmgovXaHuN
         3M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67Kcuzs0YKpXx88WCjEGQzyrzMHeJWwzbYlSdV9bf6Q=;
        b=oIwiKgD5uxEsAukhu/8RS+aUX/TdbQ2sfLrIGJSyyibBDG3J1VhsdpIg1v3zw6z0dr
         ZGTjfv47/NzmAHfvdn5oCTrLs9kbFEuZGPG4RPPaTKcHgkMORdHghW4vp6nyPgou3gn4
         juJRaOLSuipwt5ANywS4YMxwzKYUITAMCg6hQN27OfUXpSoRvtmLVPdBBb73IpVALTMw
         3VCBeNGFp1YdVFW7hxlSL3I96vWgR6j+uUfRVex7DdhLcjfZjLiu724mvu+GN6s3LLl/
         z7rXpAPzgCOltP+avcKZGx/Ll15Xy5GWesrTcFw+PC0Mw4gV0eUWZcMTvP+T55h9W7G0
         bIdg==
X-Gm-Message-State: AOAM533EQ3utApGydBUNJsDhNEwtx4VdGc8pBdrAo6SUuw3H494aVg3t
	Xf/wq2Jlk5FQsd7oMU9otQs=
X-Google-Smtp-Source: ABdhPJxlgPyjAigRr3IRkrz9jfhRDtCZdzSo9a1pZP1SARM3Z4krfhSVP9ycUKCoQos0C57NnvMcgg==
X-Received: by 2002:adf:8919:: with SMTP id s25mr13931537wrs.185.1632517905484;
        Fri, 24 Sep 2021 14:11:45 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y64sm10344297wmc.38.2021.09.24.14.11.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 14:11:45 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: tsbogend@alpha.franken.de
Cc: robh@kernel.org,
	arnd@arndb.de,
	catalin.marinas@arm.com,
	Liviu.Dudau@arm.com,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] MIPS: ralink: set PCI_IOBASE to 'mips_io_port_base'
Date: Fri, 24 Sep 2021 23:11:36 +0200
Message-Id: <20210924211139.3477-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924211139.3477-1-sergio.paracuellos@gmail.com>
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default MIPS architecture use function 'set_io_port_base()' to set the
virtual address of the first IO port. This function at the end sets variable
'mips_io_port_base' with the desired address. To align things and allow
to change first IO port location address for PCI, set PCI_IOBASE definition
as 'mips_io_port_base'. Also, we only need a size of 64 KB.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/spaces.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
index 87d085c9ad61..05d14c21c417 100644
--- a/arch/mips/include/asm/mach-ralink/spaces.h
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -2,8 +2,8 @@
 #ifndef __ASM_MACH_RALINK_SPACES_H_
 #define __ASM_MACH_RALINK_SPACES_H_
 
-#define PCI_IOBASE	_AC(0xa0000000, UL)
-#define PCI_IOSIZE	SZ_16M
+#define PCI_IOBASE	mips_io_port_base
+#define PCI_IOSIZE	SZ_64K
 #define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
 
 #include <asm/mach-generic/spaces.h>
-- 
2.25.1

