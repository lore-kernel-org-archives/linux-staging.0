Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DF071
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l13so1582041wru.11
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ar5UabfE13bGysyOw0jwYxGjM7oNU6FDl0ESKuL6S0c=;
        b=lOMWmSAhWgXSTBNbl20c5oPg+UAC6mEvEqvxCJW+V3TArqIU73Frrfvir/9uE89+bz
         CIstHDPeLGG+eI1LmP3W5XaeJb0XBtSCoUjg8VOM+FbYQwapGTVoTAXzjLG46Pkes0SF
         vjK97Swll4F20r0HGEn0QJsRviKtalsM4qwm5DjrQUg1U9vdLlEScti15NIQyL8SkyVL
         +PtJGP3wsoiDiAp4bDBSg0lIAb0jh5N0H4M2zO2INGXTtZMUHOU5YiQZXbBvWdIM2EWp
         dgqKcBwK70KAwIh/eOfpV62B6GmSFt9p+8cltTqxqFT7lefmR21uB6dzixgOUQZleMg7
         VmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ar5UabfE13bGysyOw0jwYxGjM7oNU6FDl0ESKuL6S0c=;
        b=PQJb+EGyiOsP9bBvKAxpJBTVNq2ZS4yMW17p91mCqa2OALPyhFv1BShIlbkAjZlRFC
         X9XAePjd8jvO97NJCg27LbNRKiW8cIv9MxnZBOZfU2PyujxLNkJ+SzwGPuZsIPEJXURS
         0h/cb8+EKn1BZx1KUqdMvVyEO5CSDeFcIctj6XF9Kn38lKyLGnjW0ClJ1xIll5Mns8QE
         SzTfSKXoyBGm9qGhLFbs8LdzGkN7yQA9f9y/a/Zjnc1uUqB2ClGYmcj3gEQHhnGAJ9M6
         0c/m9NP+QrkRu56ne72FZADhdYcelkBhfvE2dkpBinFjLtEAZzOx+g+db3vqgrl+upIy
         vdzg==
X-Gm-Message-State: AOAM532CxQlSJC9swn8QBsqBZBhouY+yw5inEFrqVN3wROjHkxggZNqE
	UFkfYDspFfcajC2Blr2G47HIQev/E7lr8Q==
X-Google-Smtp-Source: ABdhPJwsgiUBR/TNvbaclAIw7HWi3C/e9FnGoHNaRv1ZlTym9dS8cpKdkb+FA8Su+eQhjIe2buZDcQ==
X-Received: by 2002:a05:6000:110d:: with SMTP id z13mr38291185wrw.92.1620217058306;
        Wed, 05 May 2021 05:17:38 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:37 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 00/10] staging: mt7621-pci: complete review
Date: Wed,  5 May 2021 14:17:26 +0200
Message-Id: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchet contains different missing stuff to give this driver
a try to get mainlined into a proper place in the kernel:
- Make use of kernel clock apis.
- Avoid to request gpio mode since it is already being requested
through the pin control driver.
- Properly map interrupts using 'interrupt-map' and 'interrupt-map-mask'
device tree properties instead of using a custom 'map_irq' callback.
- Use msleep instead of mdelay in remaining places.
- Other minor cleanups.

After this changes, LOC decreased a bit which is always a good thing :-).

All of this has been tested in two different boards resulting in
a working platform:
 - GNUBee PC1
 - HiLink HLK-7621A Evaluation Board.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (10):
  staging: mt7621-pci: make use of kernel clock apis
  staging: mt7621-pci: avoid to set gpio mode in driver
  staging: mt7621-pci: remove some not needed includes
  staging: mt7621-pci: group io resource assignments all together
  staging: mt7621-pci: replace mdelay with msleep
  staging: mt7621-pci: directly return 'mt7621_pcie_register_host'
  staging: mt7621-pci: avoid custom 'map_irq' function
  staging: mt7621-pci: remove two blank lines
  staging: mt7621-dts: use 'interrupt-map' and 'interrupt-map-mask'
  staging: mt7621-dts: properly organize pcie node

 drivers/staging/mt7621-dts/mt7621.dtsi  |  34 ++++--
 drivers/staging/mt7621-pci/pci-mt7621.c | 154 +++++-------------------
 2 files changed, 48 insertions(+), 140 deletions(-)

-- 
2.25.1

