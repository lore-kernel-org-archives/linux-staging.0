Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB015A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 04:58:27 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id dn9so17824547ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 21:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Rwk5fL1nmMK/htiTOjUxWirSzLzg3Ni4nhkxdX7Azzc=;
        b=ginaMvHS1B9t8PH0QsHz6hp+2h1MtjZyuHJuBGpfcqrCr6wEGE6/sZsYaL9LpDC/pL
         Zv5J1K12xIKUYZchR0b/pjS6+sAA+y2BZIHXff7kqhFLYuCUfleVNxz5N1DWJzYEkH8n
         HWqJAmb5zycP+++tTj8zb3gNGKTsSIglAm3QLS93Jqs76FtuJ9oQcssZiR2zPZbegU8p
         PnDWutiHd2aJv9e0uqGu8II4W6b5Zf93p1TOK4FDKLFq6JXuaYLsCCKEk4pOX0LLEG5F
         qYhnP3CMPj7sOfVb3JMfXdraX0qcD302iRVhZ6epw+YhmVYfn0pV+HlgUfatk1oSLoGx
         7KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Rwk5fL1nmMK/htiTOjUxWirSzLzg3Ni4nhkxdX7Azzc=;
        b=fj+7NWfU/z9Am+RDjO7l2LtGD9h7ePBW3Y6aR0PfxdT6E8+jykuvCsVoOeL3cDIkXv
         V/5ySUoYYzFNNBF2jsPaCPIecHFx1cINu38Q6V1a5YSE2W98DEUQqvc97NaO+2/McBFN
         dDxL/EW7/Zzs6H8Jg6YF1G1UAl1dR6kTtnmogjH0V5kSGCYlEMO8gkB5QHElmAnu2DR6
         dyEuEhgsGpzkyQvU0UmeiKezD25M1FqVikc/mhUD4rYTFJgDJG2yXe1gtCSzlwm9tAHO
         8HIgZb0fcqlLeB2SUcSKlSddWtLG1DQsKRJWNvAN4FKcocdtCabV+bEeBuHHcxp1ZBwN
         fZ5g==
X-Gm-Message-State: AJIora+AgY0g1ZcYa94Kmh9uKYmA5l9ZQxksd8+1UYW5H6DyELAsspXo
	qRP++MG/H0exhuHkG9W+zuQ=
X-Google-Smtp-Source: AGRyM1sLrNEpc2DwxbE3ea/c15iNPPhsweXzmtrY53NrIMDXUeeRC/6xA1iY9/dKE6NCuiuk2NEJ6Q==
X-Received: by 2002:a17:907:3e11:b0:72b:49d1:2054 with SMTP id hp17-20020a1709073e1100b0072b49d12054mr1618285ejc.78.1657688305557;
        Tue, 12 Jul 2022 21:58:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id kw24-20020a170907771800b006fe8ac6bc69sm4526792ejc.140.2022.07.12.21.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 21:58:25 -0700 (PDT)
Date: Wed, 13 Jul 2022 06:58:17 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] staging: vt6655: Convert four macros to functions
Message-ID: <cover.1657657918.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert four multiline macros for bit manipulations to functions.
checkpatch.pl does not accept multiline macros. 

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (13):
  staging: vt6655: Rename byRegOfs to reg_offset in four macros
  staging: vt6655: Rename byBits to bit_mask in two macros
  staging: vt6655: Rename wBits to bit_mask in two macros
  staging: vt6655: Rename byData to reg_value in two macros
  staging: vt6655: Rename wData to reg_value in two macros
  staging: vt6655: Rename MACvRegBitsOn
  staging: vt6655: Rename MACvWordRegBitsOn
  staging: vt6655: Rename MACvRegBitsOff
  staging: vt6655: Rename MACvWordRegBitsOff
  staging: vt6655: Convert macro vt6655_mac_reg_bits_on to function
  staging: vt6655: Convert macro vt6655_mac_word_reg_bits_on to function
  staging: vt6655: Convert macro vt6655_mac_reg_bits_off to function
  staging: vt6655: Convert macro vt6655_mac_word_reg_bits_off to
    function

 drivers/staging/vt6655/baseband.c    |  8 +++---
 drivers/staging/vt6655/card.c        | 32 ++++++++++-----------
 drivers/staging/vt6655/channel.c     |  2 +-
 drivers/staging/vt6655/device_main.c | 37 ++++++++++++------------
 drivers/staging/vt6655/mac.c         | 42 ++++++++++++++++++++++++----
 drivers/staging/vt6655/mac.h         | 35 ++++-------------------
 drivers/staging/vt6655/power.c       | 21 +++++++-------
 drivers/staging/vt6655/rf.c          | 16 +++++------
 drivers/staging/vt6655/rxtx.c        |  2 +-
 9 files changed, 100 insertions(+), 95 deletions(-)

-- 
2.37.0

