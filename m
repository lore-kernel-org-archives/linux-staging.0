Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0730C72
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 13:21:57 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso3406351wmh.4
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJ8BZdY4CK/WA4KNkzE6wG4YkgzMRNXkwMGGqsPDOTg=;
        b=fOwiD3GzIWSZXJbDV9/MJERyMBPbBKexbn3o5KQrT9wLzZnpLZcF6bBMGAnTyTws+5
         uUImqsQTxuaCv6QhvWVuCJuCrPyMojXXYeGstJ4MLPeG/avbT3QGNNWt6vQL/edY0g2t
         W/d4FZzrECdfcmn62SMiI+k6Uq2ralTGuPpJwVOr5N/MPXKw8Q7+zPwBwnzS2/Kyu8im
         TFvNPEN0p06nlxNVyfx9GYzb7tvgnjgxVbMDbXw3d+ZqgIuYcvtyPk0cyLprpWUCHmKj
         277gw1MDQc+9TQWkFKMlqWfGyfGYdbbpVh/5zGMg2srn6uk420AO3m5OT0Q/OUrv0js9
         fA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJ8BZdY4CK/WA4KNkzE6wG4YkgzMRNXkwMGGqsPDOTg=;
        b=KsKyNR2X600jYNHYKuXtC1AxIoCd4CfoNFDkavdi3EcUKANcYQM3Sndw3vrDUQv8Ml
         JUAOU1yvyRyAnTji5l2Ei/OWSpsRHcAhslXMJCnRdOGoDBrtIe8M3li2lgB6/9fU2be5
         HGuUxcyzdqutx2dao/2tLZ9RUJx5hgrYTH0qgZa/DrMoysI88VkNJnlUbmYB9Ptbxgzx
         ECQbPL/CabSqHlnhiCuT6nTg/LkuRPa1gh7KJPSVhjlFoH9eFes1MBMwFcgVroMEe+PQ
         cjJXKlxmgUEtBE5sVW03jObs+YSvx92uYs/Bgt/vjwOUg2gvVGNYAT+5MWGlUY9OIrMX
         154Q==
X-Gm-Message-State: AOAM531P58AqIqJZxKuwX0czB8iQ34ToY1ypDrO+YWEAm/2bBhvQfyxq
	eVonVcKOxz0f3oVpMJeKKAOW0+kcTMPaSw==
X-Google-Smtp-Source: ABdhPJxzt/+IQcA4axDs0s3jleah1wX7FZ5QsoeDaIHyn7Zfyb4dytBYV88HX8horTjtyQsRvCPYgw==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr9884799wmk.52.1620220916377;
        Wed, 05 May 2021 06:21:56 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id a21sm5905796wmj.34.2021.05.05.06.21.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:21:56 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 0/2] staging: mt7621-dts: organice syscons inside device tree
Date: Wed,  5 May 2021 15:21:52 +0200
Message-Id: <20210505132154.8263-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This two patches organice all the syscons inside the device tree.

We currently have 'sysc' and 'memc' syscons that can be used. There is
also a 'ethsys' node that can be replaced in favor of 'sysc'. We
also should use standard 'syscon' strings in all of them.

Sergio Paracuellos (2):
  staging: mt7621-dts: remove ethsys node
  staging: mt7621-dts: use standard 'syscon' string

 drivers/staging/mt7621-dts/mt7621.dtsi | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

-- 
2.25.1

