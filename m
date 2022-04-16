Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6446F20F3;
	Sat, 16 Apr 2022 06:20:29 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id bg9so9853559pgb.9;
        Fri, 15 Apr 2022 23:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mID4Q7Oy5vdVFWCrost986cUNbsemXABJB5WYtGqo7s=;
        b=MOsQpB6P6OmUeKPIYslvJ0lIWOikcXOjyVnuW3mRJ9yPuHGk4t/d9nL1IxsDRRYnCf
         DDhS3UW5qLDjgK/SVsboQrrF6nV8igkpEzXLlPRj5ABwqhAtbd6PfTIcTGKnLKrlayhD
         2RG/SV4Qxo3v0T8HkCg0WhBaHiQBP41cojQiL7cqB2tTJTgaCeE0j01gz4Hp+UUdX931
         ZSjG/HxQ1yDauGl4iVqjUmPD3i0HsIKw5MW+AHAThE1+n3n9kAgzlAORsUVSOF7kza5I
         chpQ+Cinzer5Xb9HH90oq2lV2dnjwAugfKGIshAlQTrxRtDIl+3POJFzH6ztDtBW/z7A
         WMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mID4Q7Oy5vdVFWCrost986cUNbsemXABJB5WYtGqo7s=;
        b=Y6m064s2oVmsZ2bYT3yY33HZn09ciR50tE3ImjrvX8hLB0G+7VmK3BiEcRrdLmtdsi
         32wddQakoqJOulADB9IijmSNOyhfDA0Zty4wDWvQIh6u8g6uwfLSdqENkTff+76LmC71
         RphLmaq+YyYm9kaBTHDEhnsGtU/oqV+FSuxLeMsoOb+Arn/1t4pr12fp3wz53pUvkmPn
         jgpaEzo+sUcumVnZHbqj73J9C/A3302bW+cfcuIi+jwET7OTmidOE1VM4+ffYK7d6YYq
         2ygv4XQ3jFN7whZ14IEkTUo8/h9Kb/9ivB8Wa5yQ+Kh3hbSF+Qpv4MxTrXvSHauuv9AV
         0iKQ==
X-Gm-Message-State: AOAM532MAGbd9ACBF7aICUhuEGFLDIZDFQNc3lAD+hVgnzvpb30SR6ah
	KsNeLBVqkMX2CHtOr0+dN7c=
X-Google-Smtp-Source: ABdhPJzCBF4WLTMb+id3pXyWZx9SOAxqCcgwN3ur3pGF6UG2W+luavjOfk77uSXxP1vpp0IATQUAyg==
X-Received: by 2002:a63:b20e:0:b0:398:5b28:e54a with SMTP id x14-20020a63b20e000000b003985b28e54amr1874512pge.443.1650090028828;
        Fri, 15 Apr 2022 23:20:28 -0700 (PDT)
Received: from Negi ([207.151.52.3])
        by smtp.gmail.com with ESMTPSA id o123-20020a634181000000b0039d300c417dsm5988151pga.64.2022.04.15.23.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 23:20:28 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH] staging: qlge: add blank line after struct declaration
Date: Fri, 15 Apr 2022 23:19:36 -0700
Message-Id: <20220416061936.957-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Adhere to linux coding style. Reported by checkpatch:
CHECK: Please use a blank line after function/struct/union/enum declarations

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/qlge/qlge.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index 55e0ad759250..d0dd659834ee 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -2072,6 +2072,7 @@ struct qlge_adapter *netdev_to_qdev(struct net_device *ndev)
 
 	return ndev_priv->qdev;
 }
+
 /*
  * The main Adapter structure definition.
  * This structure has all fields relevant to the hardware.
-- 
2.17.1

