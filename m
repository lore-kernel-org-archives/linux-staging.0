Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37CB3D74
	for <linux-staging@lists.linux.dev>; Sun, 18 Jun 2023 19:44:59 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51a52fff2f0so134496a12.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Jun 2023 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687117498; x=1689709498;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idXdS9jRPviKMoRt0bBHppB9dZDM/k9Odq0fiPi3ljQ=;
        b=IlKWWrskmi0qXvsLQAGP2OJCKq8McIK77wKkLTL8KfeFi6SZrWrLJc/Dop3G+CLBIK
         NoHhIWrxBNwviCbn4CAnmikM0G7jeHV/dLI1iViUICWf+Whw12ybhF4bv4LP0y/+Y4t8
         ToQfN/uV/vjcMv7InR+DFZmEcyaV1eJQ5hAUgefr6tS/im+wMHvjs2Wbu/eVw/t3LcuM
         z8J6qv1mjtqbWdBMhsMg2EmRDj4mOOu64UPscpCt/korxciCNKUt2bqLJEN/qK5Nugeb
         PoixWLviM8UspOF8OxFAPfQr5FCYpNIBngAK3+QO5/aR589BgRls9NYZe7rbtCKnrTCR
         TvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687117498; x=1689709498;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idXdS9jRPviKMoRt0bBHppB9dZDM/k9Odq0fiPi3ljQ=;
        b=Wy7yU8KiwH9wEwwxBfDjW3IrNJuECNzb+a68vtHJDXm4z5+GdqKB4UCum+W2k3DRrl
         0c2/zpzfFXEEqXgnCEjLpeJTZmPHgGcBsBsq4llcelTSsdenI6u5DFlpBhfTZef8wL9D
         XKH6hSZ9QBdTcYX+R5q7zQmRhzpXl0O7xlpwTbJmZzIjpYLNtC3QbyWNvYFlJrh9R28+
         7yb5qhLOnPo9n+BR8AeiLkzbFLCmEvtnYYzdCcSNgoDRAaY2MC6q22QYpmDw6eOG9KXw
         FBvtCKyVNBlkAIzYVWTlci1O6An3DKrsFpuXMiV4XsPOafemJBHQyKIzz4mCPpkGajE0
         4W0A==
X-Gm-Message-State: AC+VfDwOz5m5edDdTRIfzpvVzTQtDVMuKj58MO6hbKGjo3MJzPSZwIAv
	lfVr98bbAZQStTTlysWWW4E=
X-Google-Smtp-Source: ACHHUZ6C9zgdZYCqZ85VizVH6aieT5dj7JUJQJdATrVopZdXeyGOlAOhfCEuzDniurqxZDjJabTyNQ==
X-Received: by 2002:a05:6402:42c9:b0:51a:4dd9:4308 with SMTP id i9-20020a05640242c900b0051a4dd94308mr2100323edc.2.1687117497730;
        Sun, 18 Jun 2023 12:44:57 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id i17-20020a05640200d100b005183673f2fcsm9014806edu.69.2023.06.18.12.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 12:44:56 -0700 (PDT)
Date: Sun, 18 Jun 2023 21:44:54 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Add missing entry CFG80211 in Kconfig
Message-ID: <20230618194454.GA10653@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add missing entry CFG80211 in Kconfig to ensure that CFG80211 is
available when selecting hardware rtl8192e.

Fixes: d88b46ce5ab8 ("staging: rtl8192e: Add cfg80211.h and remove defined variables")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306180620.Ew55XtKJ-lkp@intel.com/
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Tested with rtl8192e (WLL6130-D99)
Transferred this patch over wlan connection of rtl8192e
---
 drivers/staging/rtl8192e/rtl8192e/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8192e/rtl8192e/Kconfig b/drivers/staging/rtl8192e/rtl8192e/Kconfig
index eae8167f79dd..f8f774a16295 100644
--- a/drivers/staging/rtl8192e/rtl8192e/Kconfig
+++ b/drivers/staging/rtl8192e/rtl8192e/Kconfig
@@ -3,6 +3,7 @@ config RTL8192E
 	tristate "RealTek RTL8192E Wireless LAN NIC driver"
 	depends on PCI && WLAN && RTLLIB
 	depends on m
+	select CFG80211
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	select CRYPTO
-- 
2.40.1

