Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401137C;
	Tue, 21 Mar 2023 04:21:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id o7so12352026wrg.5;
        Mon, 20 Mar 2023 21:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679372497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FaA3YcfbP2IfbH5dMI6u00735TG6aAqY5ouGiTU+WFk=;
        b=EtrMWxnRRahazbpCMKjpmWwtsarzSHOaV8RTrJMK4Tieua8mA6870vyBXSdwgZpLww
         Q7rqQD6789WQ4Yks+JOYwjL2jyoF+GUokGtRiuO9eqY3+AgR8RZKScux+Ivjcrn3IkUS
         R3jNV5C4BTMMY0RcEN0c2H0H8NfAVbBAwf4gYPHYEJylP44mBULHDtp8Mw1CT5nQ6Nwj
         /0Fp+Y/rVk01hdpNoVgeEkmGwTgcU4i2QUlMJw3IADa5RlpQK/htT4/xydc6PKAlkPEi
         99a4VkdCezsLRgm5zNtNUdo1zFPQFqv0YYW2dAiYFbMyMurMJekoKPV07X2xcbpt8n10
         FL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679372497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaA3YcfbP2IfbH5dMI6u00735TG6aAqY5ouGiTU+WFk=;
        b=jNN9afUOqOpz8F+jHM1zS9PkYFDwGzuQwFa6DwY/MJH2mX8tO2QLzNwmCGrI6qqLBN
         Ww/Dow5pqbd6aLsib1e1HNXK6PSid+klmoHgqJqeZ2ZQ6+HbJrfBFDdNg26hgDsqRrNC
         chhey7dKYFnSAkD+1Z0wjduOj/4IBcMZo06v9+z7eKtiFuCQwRgvaOWSk1JKB1PS57z6
         zhVnh7fIHpiwD4/Rjd9nHmqCGVqPFgZsye/1x9udIS0kMyzrE5gxiVMPNlMKGaPvZHIO
         xUhp12sJLs6J7enc507rX6CTs9+JD+I1Lvz6vAUpW/w6VDJ3Nd8eWCog/4+39qATwDT8
         Vlqw==
X-Gm-Message-State: AO0yUKX5m7+fRUX/dMy3VSp23alUmWQaawOUEGG+Xe/CHXbgyjNWs/Ah
	dg8mgzGF7u0msrkMRbdWVMI=
X-Google-Smtp-Source: AK7set9mZGHw3yoEvNxRRdaPhFjETeu4dlT4c5n8MfQKVOlfTRsqWB//SFmS1Q1Nlouet/QTsHbrfg==
X-Received: by 2002:a05:6000:541:b0:2d8:ce83:5de0 with SMTP id b1-20020a056000054100b002d8ce835de0mr903209wrf.48.1679372497306;
        Mon, 20 Mar 2023 21:21:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d4e84000000b002ceac2ccc4asm10317162wru.23.2023.03.20.21.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 21:21:35 -0700 (PDT)
Date: Tue, 21 Mar 2023 07:21:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Kloudifold <cloudifold.3125@gmail.com>, outreachy@lists.linux.dev,
	teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, alison.schofield@intel.com
Subject: Re: [PATCH v3] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <713dea35-3db7-4898-912d-b52ecab0a420@kili.mountain>
References: <ZBW+NX4SLaCyEnJd@CloudiRingWorld>
 <dd1e1fcc-2a4e-438f-ad61-ef7640b8e423@kili.mountain>
 <6418ca43e651b_2c274e294ae@iweiny-mobl.notmuch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6418ca43e651b_2c274e294ae@iweiny-mobl.notmuch>

Fair enough.  Also I wouldn't have said anything if the patch had been
checkpatch clean.  I was testing to see if the extra --- lines mattered
and that's when git complained about white space problems and it's like
you say, the extra --- lines don't cause an issue.

regards,
dan carpenter

