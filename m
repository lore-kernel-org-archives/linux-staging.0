Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962EE6FAA;
	Wed, 22 Mar 2023 14:22:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h17so17255649wrt.8;
        Wed, 22 Mar 2023 07:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679494974;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7X/sea70dluHDkMLiSPr+5a4l7Uo9ZKTt0hyEIsAVaQ=;
        b=CFMsmld2enyOg6yWooL32HVlSN8I4gSHSC6f9QaYYDjX03DMpN0XncjRLMbR2oPipt
         5FCG1CqmyL2X6r9+Y6Xf1XDWcFWOXVzbmqro6ye2ILtfc2HEumap9opV5D9kamWkKYIb
         sVyG9Up40+/8tGaXG7FBn9zo2RsrN8WuFufim/HRRwIuthwvm6eiKYLJYjUVJzL4EGnj
         GWjdz/Py2gRJeklfMRvy4fg8+4Pv683VhnZz9QjWwWx8hg1zHhM7W0X+IaexHg8iXCxT
         B6xUu5IMqSt0v7FuS3qIXI5hrKCNDp2nAkVHfGbLQu+1RXj3ycNe5fsTe+FZvZAarRLJ
         wMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494974;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7X/sea70dluHDkMLiSPr+5a4l7Uo9ZKTt0hyEIsAVaQ=;
        b=IOcZ49vqJsltE5dhqieUwHnK8xPTsvcc0UrQjIMl02N9+kmQ7jMs9oIf4f3TNsoteQ
         daMvQuTWIJDR2KDsHZ1Q2tAmpPt7oKVGx3Sd8aInF02dT+BqcmCovkD9EHyCEFRIacPk
         a6c4HINWii+n+AaHkp1WFWzf7TIlpWeM4rL2qDCn79dy2QH6+gHGk4VrFxcLhvr8Hz8v
         Ru7nnVOS96cfiAhju1VnBa1ImLqOWjGSqrzlGHKkxJouFnUt5jRDwGRQOO/cQ8IHen1i
         ZLMW0EEwot+Xa+jtbv++po3RCh2LJmotIGXcvuK1tv2orPzzkD6fsUgLO2XkVxyS774o
         QYfQ==
X-Gm-Message-State: AAQBX9dvw9NV/AX72Plrdu2Fzq2CtKHsZMazZ3foZKErACIaWqXttl4j
	M17tL3kzZ9akudBYJpxonjo=
X-Google-Smtp-Source: AKy350ZEGoUrD+C7SMSCbODr+7cMWRowBX3EGFPCLpYLlHEDQrhzowPfhIswpi2gf4T4eGo1469hKQ==
X-Received: by 2002:a5d:4570:0:b0:2d8:908c:8fa0 with SMTP id a16-20020a5d4570000000b002d8908c8fa0mr20154wrc.9.1679494973614;
        Wed, 22 Mar 2023 07:22:53 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d6a8f000000b002d743eeab39sm7210957wru.58.2023.03.22.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:53 -0700 (PDT)
Date: Wed, 22 Mar 2023 19:22:50 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: remove extra blank line
Message-ID: <ZBsPOk3TgQTfNAAK@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove extra blank line reported by checkpatch script.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 21d1c9f24c3d..9fa665c4038f 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -989,7 +989,6 @@ static int rcar_gen2_enable(struct platform_device *pdev)
 		writel(0x04, dev->io_base + 0x600);
 	}

-
 	/* BBCR = 0b11 */
 	writel(0x03, dev->io_base + 0x500);
 	writel(0x0002FF02, dev->io_base + 0x508);
--
2.34.1

