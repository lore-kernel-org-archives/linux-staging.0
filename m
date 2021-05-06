Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9361771
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 17:07:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o127so3766953wmo.4
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HGjMUZuhy3UyuyHaqOa/uQiL8scrXS9m3puzslcWWRg=;
        b=V1vzLGNzhbwb9Ao4O97cIJDNLH3cDChRdqYqFfSip5rZCj9I0e0iwXdo5fYF3OmGSk
         YP4AupKnDgc6MYq68j+9d8yQKzxgts/34ZukzrqL6jX3EmHYJel3AGupaBanG4rsNUca
         UdIagWv56GGUVR4hRq6ATJE1f0YsVzzCSh8bNidGGCTsvN9urSz++GiLj//7eEJKS0S4
         ztm/kcr2Mte0ag2xc+Shnaq3dMyjkqKU16bcCrdhItiRWbGnzxDacCXqzVaBtxyETwLB
         o1jGEQSFpgY5Gv1uN1j/uD86owG1gDAMAUXgRrPwVwNMQ4N/tnZrzTr6/TFJaL/8sqV1
         Kt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HGjMUZuhy3UyuyHaqOa/uQiL8scrXS9m3puzslcWWRg=;
        b=sNLDuuvK98HZQlcOxs8fZvlQwBcR6OPwN3hl2nxcf/USn1eicNg5N7AFpH3Mczn4fl
         nVayyabbTp6JlkhFJ+RSaYgRRgE1j4+Vn8GCoXPndJCpmvRFAD95cJt8veZTam/YXTU/
         lAKjPwMzbMrhfVTM4/FySe17xGUw6lvBShuN04uNX+hnhVhIZ6f5dbqQ/VAYHFwFIu7y
         DqGNJ6hTRrktELxjbuoBs8d6nWF8fHxlFmFfTvPY6Cfz8f4FsveKzfOKix5cuBVp409D
         6PrdZ30utWyaHENXNtnACGybNLV/Q39XE7o9/HpC744ZLV17ioYUihfctGiGFUYnZg3X
         Z9Rg==
X-Gm-Message-State: AOAM532yQpPB+bCyQlJEt9RpXFpOVCTXt8zcWNs7tRqyo635aTHzDVIS
	6c4hT3+dfmphGiGqZ21fxnnxUHW3KVQ4YQ==
X-Google-Smtp-Source: ABdhPJz1wCEVTx9BnzzcsNJkmvZ36hJIwvLanzIIeb4PQW9ReGhu1t38fFGZodLyQ8SKKHmrdNmqbw==
X-Received: by 2002:a1c:2785:: with SMTP id n127mr5135036wmn.52.1620320864867;
        Thu, 06 May 2021 10:07:44 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id w7sm4986378wru.51.2021.05.06.10.07.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 10:07:44 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 0/2] staging: mt7621-dts: fix some pcie node properties
Date: Thu,  6 May 2021 19:07:40 +0200
Message-Id: <20210506170742.28196-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Some minor changes in pcie node to be compliant with 'pci-bus.yaml'
schema definition.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (2):
  staging: mt7621-dts: remove 'bug-range' property
  staging: mt7621-dts: add missing device_type in pcie root ports

 drivers/staging/mt7621-dts/mt7621.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.25.1

