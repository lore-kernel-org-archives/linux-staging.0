Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F147E
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 18:20:51 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id fw3so17949394ejc.10
        for <linux-staging@lists.linux.dev>; Mon, 04 Jul 2022 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j/4mrpFh2VC3VcVrJHlOYXFL5VgTeC9Ovzmvx1towKw=;
        b=VEcDxqNRwQ18kFq8J9qG8BH10PMPS98sEiIlM1yHXXSc65M1DzkaxpssEVqG7QZAT+
         1T0+z1wduMLTcAa81FsyITnrTxjf3E0JCJ+BxlgC/spH/NaOnLVmivxSz8srPxGpZwTP
         c6IC92aH04uxU5rm+MmaE/LVDrqHTgKZVnflBLopeEpSOLTppJkdlCp/qUK4YykROr+G
         mdaB3KslpCDwB9lBoUC79dPtqA5v/WKQ6OQi4THKnhOJ9IUlM01PoPeflzwrZN4s66DG
         fMbZWIkzTA3Kr02DpzBYz0ySnFvokQ6lBXOlrxceYJdwMeO+V8GCm1yzCtKQkc1pGH7g
         rv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j/4mrpFh2VC3VcVrJHlOYXFL5VgTeC9Ovzmvx1towKw=;
        b=O8z80mRO6uc9chTqvOPju4u7MbcFvdw8lGuWAt95CdzjDFWpvu9+StZ+wBL9aR12JW
         w5KEeF1cKoma2xNupTziA98/JMF6RHdVxalgogQJ1D7h8hIyO1CAK/gg7LMMRTqYy3Fp
         BxP30KfnZ9x6aO5+qoxFBWA0NOEy1V9rIbq/iasdKvTQ7rzIk+Islx1SybN+6F66TrV5
         hULjk9bw7pur2arep1cINeBgTe5R1z+pN31TazIGvXTMgxltuyz+mQD2wKGLahqLSzHF
         6DjEAU7+Esctn+jBoHhUOQzxZFRbiuIf9tPiKfRY1jKamljIPrq2udTh7ZACFymWrOEp
         zYvA==
X-Gm-Message-State: AJIora/lfw/v4NXXGSwBcawCQuUBdFBQL3RW+bQLQk8B6wnGwgy2jSUG
	11QvB8NpDJNyNe68rCe6p/o5XTikdtw=
X-Google-Smtp-Source: AGRyM1tXqNG/QRjwS0/M/cdpKxCw5lRc8L7RzqHNeXMOhLVnRT0BCKC/UmxpWaFqjkichXX6AK6hJg==
X-Received: by 2002:a17:906:54c3:b0:6ef:d07b:c8ec with SMTP id c3-20020a17090654c300b006efd07bc8ecmr28840942ejp.687.1656958850201;
        Mon, 04 Jul 2022 11:20:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id fg8-20020a056402548800b0043a3f52418asm3153435edb.18.2022.07.04.11.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 11:20:49 -0700 (PDT)
Date: Mon, 4 Jul 2022 20:20:39 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] staging: vt6655: Rename MACvReadEtherAddress
Message-ID: <3714f7cd3425e0ef0a3df0cc291131cdb85a3796.1656835310.git.philipp.g.hortmann@gmail.com>
References: <cover.1656835310.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1656835310.git.philipp.g.hortmann@gmail.com>

Fix name of a macro that uses CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/mac.h         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 6cf21883d1fe..b9c57c661729 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1722,7 +1722,7 @@ vt6655_probe(struct pci_dev *pcid, const struct pci_device_id *ent)
 	}
 	/* initial to reload eeprom */
 	MACvInitialize(priv);
-	MACvReadEtherAddress(priv->port_offset, priv->abyCurrentNetAddr);
+	vt6655_mac_read_ether_addr(priv->port_offset, priv->abyCurrentNetAddr);
 
 	/* Get RFType */
 	priv->byRFType = SROMbyReadEmbedded(priv->port_offset, EEP_OFS_RFTYPE);
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index cfebd126e42f..ba5575d63db0 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -577,7 +577,7 @@ do {								\
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
 } while (0)
 
-#define MACvReadEtherAddress(iobase, mac_addr)			\
+#define vt6655_mac_read_ether_addr(iobase, mac_addr)		\
 do {								\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
 	mac_addr[0] = ioread8(iobase + MAC_REG_PAR0);		\
-- 
2.36.1

