Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED572F32;
	Fri, 10 Mar 2023 22:39:25 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id p4so206195wre.11;
        Fri, 10 Mar 2023 14:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678487964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5PuvKOvfLUjyVO4mPIX/XjsIPQ+ajMnbP2SJqNrL1cI=;
        b=oXFqjObqygxkHRfqqAMKRIVwozsa0l3DRG6a6G7slqeC+CHe384vkDLPFFrgbGeydG
         kOyWZjR1179dMQJLO+/tAshkv3m/fLIQ9GVzY+IpruvMWcjLnEFkfdIjGzLuE3mCpzMl
         pPcnQljNsdvoaKgdB+l6cu1hkxG9Itfx6XfTpL8ZJAzK+z6tsEy4BMFChg/kwBhWE2PD
         VXznHjVeZosZojk7dMs3t3JzdXmlhdhS3gtM8Uht7t5EjvAM2UYmD2GidzVMbs6gI2A6
         h86Y9mL27HXXz9sUl3QlbAPk4Gq8EuD74Mu7I5Ox+Z05pfIyMha48spVo9zCnOxh5f0B
         dosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PuvKOvfLUjyVO4mPIX/XjsIPQ+ajMnbP2SJqNrL1cI=;
        b=sDtK0ZF7vaLSpJaeEfeyZ6LeD4AXjiKuDUBRE0HYldIdICh7aoSu7ziyTTmh0i9VeY
         IQNtc6iWDWj9PUVr3/i1pjW6JrhEnzVhxgaGCaBrvyemVxd1vHGbl4mxq0cTy92xc7m4
         xf5huk5ji85t/I6ao01oUN7j1dDZ1xaplPmsUMgCu5fhcyXJJKGZkQKbXsPvGREs/7Et
         r1o/BubxT1/eZFuwj7eDa3sYYt7otgQr6+3bfiRrdtRI5bvYdP6ipLSZf6a1OaroiPU1
         Q/mzZb0lN0raIdPlhoIFa4t0zkyc0l5DlwmN8O0Nhj03leioEDhYE4Xm6ncl4fOHwkPm
         vzyw==
X-Gm-Message-State: AO0yUKWkoa22pzzS/b7Vn2uHILe9gCKNA8LBIZK8twuENZfd966hJiVS
	s8VgckbFwxRrnY9S5GJQ3lQ=
X-Google-Smtp-Source: AK7set/7u/SY1mUQXvz+1eJcT8g0IyPHytdodVx6/Y9NnoSmRa1Uw6b/LVVnXac95BUA3XmVBqxmqQ==
X-Received: by 2002:a5d:474b:0:b0:2c5:a38f:ca3a with SMTP id o11-20020a5d474b000000b002c5a38fca3amr2557906wrs.10.1678487963664;
        Fri, 10 Mar 2023 14:39:23 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bcd10000000b003dfe5190376sm1095707wmj.35.2023.03.10.14.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:39:23 -0800 (PST)
Date: Sat, 11 Mar 2023 03:39:20 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>, julia.lawall@inria.fr, drv@mailo.com
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix exceeds line length
Message-ID: <ZAuxmGmVQMSwig44@khadija-virtual-machine>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <eb7475da-7548-4820-a2b6-ff0f6cf4be71@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7475da-7548-4820-a2b6-ff0f6cf4be71@kili.mountain>

Hey! 
Sorry, I am unable to understand this enough. Since it is mentioned that
the patch raises another checkpatch warning, should I stop working on
this patch and look for some other files? Kindly let me know.

As for now, I have submitted another revision of this patch.
Thank you.
