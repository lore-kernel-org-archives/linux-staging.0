Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4C823C7
	for <linux-staging@lists.linux.dev>; Sun,  1 May 2022 16:37:02 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id t5so3643929edw.11
        for <linux-staging@lists.linux.dev>; Sun, 01 May 2022 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=cHz2Chb4WauAyCgl7HzeNesuAPLoMUd1ln+Xeg1BqlU=;
        b=eIICAgahx1Pi255U+g/Kk9Q7E5jEghl2OH+0vD0b58A9Qf9WLKIXcSVkxW3MxGQE/V
         iifLdPlHOgbvsQ4jkFjZG5oI4vZWjpKsXXs9oowHCCCELnPzNZsQpgZSKxxcDH4rE2x9
         b8CGqLFBfHniTLTO3c5XT+ocNkkO4dahCO6AbwQwjSMch3TAWaH5jWKGm2zWZA9jyNTE
         feFklMibUOADm9SjVMl5vEs+XRB6Q4pYlLIXPCsHqPz1pUTLOpdwAJuJFNwHE6fXaSef
         u9nUoiNecC55Zkv+5dy31XOhkzXoSLHQF4BLSWqwWb+uVve6qQbMWxV7GaScdQbMfiIl
         9mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=cHz2Chb4WauAyCgl7HzeNesuAPLoMUd1ln+Xeg1BqlU=;
        b=hPuTOxqR1YGehpxSFg1YBNF6bYKBTz12zX87e5/r8QiMfKvvMSNnDzMukTOqXwR28Q
         xftlKeagfIXZ9eHGh68Mahr57Qq9gCPkWJfSorfzMAWvuRSLKZU77m58uDAolT/ETWLv
         4D+bZL4TzYfEWqBIqwt1mRFlnxXzvV7/F7C7c8X7Mhe8/eCBC4RRSZsLR470Uv2a8wII
         SJjRWimPWr9drGI2Gw5igmzRTEBolK8hCe1IXPVnZLmu93POns2940nYySCIc++6gNqu
         f5FPTwhIYbO4hmzl3urNxRbmzx9HDO3/kCUCLEK1zml/yXRFkDHveaQ4z1PSbY+Mp9zQ
         bXfA==
X-Gm-Message-State: AOAM5322A2Y65C//qzrdnB9e/zSE9EFFmEnhrCBiD9uhmx+4sSIBx7OG
	rFtduPkiqZJHGJvkITCzDrU=
X-Google-Smtp-Source: ABdhPJz4KRMo8eAqZm23yzk/ee5LqUPVku/+0DMinYuo7KtVI/w2jd5IdlzNDGxF29rOKpZtADHcNw==
X-Received: by 2002:aa7:d708:0:b0:427:b5ee:b8f2 with SMTP id t8-20020aa7d708000000b00427b5eeb8f2mr4594397edq.404.1651423021044;
        Sun, 01 May 2022 09:37:01 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id u5-20020a056402064500b0042617ba63a0sm5551023edx.42.2022.05.01.09.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:37:00 -0700 (PDT)
Date: Sun, 1 May 2022 18:36:48 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: vt6655: Fix name and return value of
 CARDbGetCurrentTSF
Message-ID: <cover.1651422181.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix name of the function that uses CamelCase which
is not accepted by checkpatch.pl

Replace unused return value.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (2):
  staging: vt6655: Rename function CARDbGetCurrentTSF
  staging: vt6655: Replace unused return value of card_get_current_tsf

 drivers/staging/vt6655/card.c        | 22 ++++++++++------------
 drivers/staging/vt6655/card.h        |  2 +-
 drivers/staging/vt6655/device_main.c |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.25.1

