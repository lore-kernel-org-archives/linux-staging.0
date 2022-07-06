Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C27C
	for <linux-staging@lists.linux.dev>; Wed,  6 Jul 2022 19:19:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id h23so28684680ejj.12
        for <linux-staging@lists.linux.dev>; Wed, 06 Jul 2022 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=zAcGzWs5eFUSfcLvPQCXZ0dttFV0YKOa/siKsgyxWwo=;
        b=kUPUsLGTefIaMM17nQCIrX95u5qEJBDBwEVqjFwgrNCC8n/0CrxQDG6nEMAz0Hp/xp
         ewXNcELyKhyZJPeAXrf5tqPDeHwaxlJ9KYzMp4wN6SwptrF9CXRnr/B4TlW01pGUiyhw
         ngw9D6QIu5NTfw3fn6oUqszvng+10WJzGKUkvCOCEQBaFmZISAJ/+WvbpCuU85f2Zn53
         4/p78v4CGna4YljB5MXv24mQ+R9wUET2E981mrY0g4BdS4I/VA5zztDTeNF22oCqNaMs
         i0kg+VoLOzcPGkXoLD+kTEDh42Gwj//bJYAwvPM2N7ATTjGwWw19TqsADYDnJw3HnJLD
         DNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=zAcGzWs5eFUSfcLvPQCXZ0dttFV0YKOa/siKsgyxWwo=;
        b=KITTRAlHv3xzs/nUO076Godxn7ZDPO4KVPJkeVa+6qeRHqIZ0cxwGqGnX8IkeRE52D
         o1mfOJ7OkzsxgAMAaJ6D+ptEKyCTlGx/PVfGE6qz25tf5WI8mbPAUt+X/N93WlYMHHLI
         0MC3WhgZshqfcQJCdvcpxdZ0i940H4P4Z+/3xLdvdqPsxyhOg19QWDTmu9Bg2Kb0X68V
         eevSJHcu9X2Ku3JwFj0ujzxsfhtwxCPHvbXshYqLrxL5z8Ew9yJooDOeII8lGi1DbT1J
         rXFuC5DqG+R7gnNXxSw9hZ2CPBQTrPgIgvQv07d3oXnmU8eVivtm/rVtM0ELB8JgFHp8
         lspA==
X-Gm-Message-State: AJIora84MecPNVO3ZAHGV1IOIt1bldE+5p1JcMfwZy1oxOV/mUwa9PQQ
	S9TbTSSGY9DvztiyqmImBF4=
X-Google-Smtp-Source: AGRyM1tH85PhKldtjBepn66CCNtAvEAQu5ouk+3cAb4SwKlifDItFYCuw9VB+CGZUN/5rG0BZ3Q7PQ==
X-Received: by 2002:a17:907:7632:b0:72a:e615:30e3 with SMTP id jy18-20020a170907763200b0072ae61530e3mr9905460ejc.675.1657135139100;
        Wed, 06 Jul 2022 12:18:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id a9-20020aa7d909000000b0043a706d3a48sm6451971edr.76.2022.07.06.12.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 12:18:58 -0700 (PDT)
Date: Wed, 6 Jul 2022 21:18:51 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: vt6655: Reduce similar statements when working
 with mac addr
Message-ID: <cover.1657134099.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use loop in vt6655_mac_read_ether_addr and vt6655_mac_write_bssid_addr
to avoid multiple similar statements.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (2):
  staging: vt6655: Use loop in vt6655_mac_write_bssid_addr
  staging: vt6655: Use loop in vt6655_mac_read_ether_addr

 drivers/staging/vt6655/device_main.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

-- 
2.37.0

