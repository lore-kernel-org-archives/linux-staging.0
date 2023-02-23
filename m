Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B415B2
	for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 06:47:17 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id cq23so38641395edb.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 22:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsmNc0LW7KgPfnQR1pgTAG9e2DXG8L7W1cjt0n+8dxo=;
        b=X80BSI6zDmDav3I62Y4AZ6scW7/BNN44H3/n8Vms8apOHaFSQjMa6Mwd8iJ/B/ftrK
         yt3qqRuIkWvlVdOSudFYCWCpLp9aHTRaEwFYJUbxTqO1+VzQagMPscUqhUSDbDp1xGYB
         YrNvIbwiBpa5iUv8DkHILYQAjsp8VRl1ptdGYsH/eBIBkfJzNxEAIPPEyB0ZIM5A+XPx
         6utu8vHe32XZFwxhR+1sZfvk9ucNxoG3yS9VfsrFp3FqtoqLAe8VGje6YYaemTA7Q4nC
         QbNqJdf31G4Rjv6as/iIFzt9j2BjsCupWfCUQLRLZ3QQQR5IRYJqm0NrtSUkvs8OSyFm
         FFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsmNc0LW7KgPfnQR1pgTAG9e2DXG8L7W1cjt0n+8dxo=;
        b=CnIBUANS682twlti+LQ0Ltt14kLniFKTCVlYedFLtH5rVHCiNjenQwzNeEEyqwUP0w
         VMkGYrrDGiaYjo7sjd3TJT7XD6VC9qm5wgNmR/IM2aPYQSQrSnUwDO8L16GOhAvgU3iG
         725It4o3kXUC6lT+opCNQfPcxDWuV6moae9gqMeVfx+LFiGA3XXxCzWbJjPu3Ri91TYR
         iASvx/UmvxR+IBTWfdIDIiP5D9HTeMyapmp0z+SnZYHE8T6uhNw5ic2IlEWbKKNyUuBD
         Zki+k4liiyoW10XX0t3979iMju5J/fqh7MAYkoXqdZ7WcuGsA9vDzDH9yWWZsOLZpEi5
         vf0g==
X-Gm-Message-State: AO0yUKWDXbIYdKPCKcoUMiyN17rIaKy1D6vFovnEuoyfLvbnIUoNY+vl
	M6ME7f40J92pI+a05ypT/Yw=
X-Google-Smtp-Source: AK7set9rLeQQkEXuu1lHTL35o5OMi3rhw2FbznJ9KMnfsDrHRz79J525D+1Ed4I7JjC8t5KnPiflLA==
X-Received: by 2002:a17:906:2cf:b0:878:5fa4:7443 with SMTP id 15-20020a17090602cf00b008785fa47443mr17928861ejk.3.1677134835553;
        Wed, 22 Feb 2023 22:47:15 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id a26-20020a170906685a00b008b1b86bf668sm8125522ejs.4.2023.02.22.22.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 22:47:14 -0800 (PST)
Date: Thu, 23 Feb 2023 07:47:12 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8192e: Remove struct rtl819x_ops that has no
 entries
Message-ID: <cover.1677133271.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace macro RTL_PCI_DEVICE with PCI_DEVICE to get rid of struct
rtl819x_ops in this macro. Remove empty struct rtl819x_ops from
driver as it has no entries and is dead code.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

This patch series requires the this patch series:
"[PATCH 0/7] staging: rtl8192e: Remove entries from struct rtl819x_ops start with .tx_enable"

Philipp Hortmann (2):
  staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
  staging: rtl8192e: Remove empty struct rtl819x_ops

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 12 +++---------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  9 ---------
 2 files changed, 3 insertions(+), 18 deletions(-)

-- 
2.39.2

