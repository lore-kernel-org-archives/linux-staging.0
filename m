Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35DE10F6
	for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 05:59:30 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id sz17so1325275ejc.9
        for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=qwj55DDSOy6+Qm8DQ0l9gecTgOsx8eBbhcnPeMNmnks=;
        b=iIeVoA/yqmwYT62l3a4EmTNLnYNVJvfJsZoHyxzZ05dg5y1rCgk7DwtRfkxr/O6VdX
         hfesSR+l5hUBs1CXIg/d/5mxrth6ksw1zcm3pjoqTf58eolO/yrdcE1scR48RlBgoYy1
         3nGUwzNs7fL5DDhmaV6hEuBDlUrFWxPrjomClwer2lcXfmekDvbW8QYj+3h5oaNYQCWG
         M04kK0gHEhlrJTIXXnyGuVxrWbh2O+YC3yuWy9gegTqk/+ee+0LWbVQgq7zNgLGamd8z
         Fq3oda5xZ2N8h6kP51DT3V0JRuM8rhA03xQ3Wt/SU/w0QB78WrD8RzddkJ1TuEcYKAyE
         amaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=qwj55DDSOy6+Qm8DQ0l9gecTgOsx8eBbhcnPeMNmnks=;
        b=ieTWtSX1ffKCV1/leMA8PriceJveuo+SPqMiIWZaWtCKIU+MwMWGh2nr1q1Q7/4FtX
         v57IPpBwFpNItoNY21GpR6OblT505s4jAws1Zasvant4nIMEtohUT3qPqRFoYGustQl0
         fTngEIK05KHXiJDa1aoCf9IUE4UlTgcrYfX5Ker1lH4p+C07fRrGJgmKpzDXUF80TWiX
         YSqEAwfOeCidHW43lIg3vvQNIS8SdvWqgoGkwAikDK1zTIQ4qqyJRRnCtE3ldSgHdQsn
         vYjV6qpCLixuy2PzUo8tuGPfuWbHAtA3aFSXBWnzsyMIhcmkNwKXQ1NoT+ym0rYmOcnh
         raJA==
X-Gm-Message-State: AJIora8q8AI4zFTok8/DeIm3lj0LRyGihYtw3SgPJUxUatPCzn1G8TR6
	JuGqkvOjQraxkQfWTpsZBsw=
X-Google-Smtp-Source: AGRyM1u1BJqIUwBCFbMb+oovECm8I7jIzRf4TkNjVfBVDRq/Y+nUDkH4IJv7BcLj/xOQ3QJkc/p+2A==
X-Received: by 2002:a17:907:9810:b0:72f:36e5:266c with SMTP id ji16-20020a170907981000b0072f36e5266cmr19897983ejc.105.1658987969125;
        Wed, 27 Jul 2022 22:59:29 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id k10-20020a05640212ca00b0043a7c24a669sm71927edx.91.2022.07.27.22.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 22:59:28 -0700 (PDT)
Date: Thu, 28 Jul 2022 07:59:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: vt6655: Convert multiline macro to static
 function
Message-ID: <cover.1658986804.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert multiline macro to static function.
Multiline macros are not liked by kernel community.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

V1 -> V2: Combined patch "Rename byOrgValue to reg_value in a macro" with
          patch "Convert macro vt6655_mac_clear_stck_ds to function"
          Improved to early line breaks in patch descriptions
          Removed function declaration of vt6655_mac_clear_stck_ds
          Changed variable declaration in vt6655_mac_clear_stck_ds

Philipp Hortmann (2):
  staging: vt6655: Rename MACvClearStckDS
  staging: vt6655: Convert macro vt6655_mac_clear_stck_ds to function

 drivers/staging/vt6655/mac.c | 11 ++++++++++-
 drivers/staging/vt6655/mac.h |  8 --------
 2 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.37.1

