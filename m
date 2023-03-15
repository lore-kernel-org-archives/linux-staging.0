Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178AA23A3;
	Wed, 15 Mar 2023 07:47:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso507483wms.4;
        Wed, 15 Mar 2023 00:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678866448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7jivhOMF2Dp5QIJkx8toAZguDtgmdufs2dThkF05/Cc=;
        b=gYOesFjImuZKGkOWZLdnq694h6tVVEdT0BCh4sYKY/cIiA33hRhjo9bkgApd4kx1zz
         yUt5KGZTRU8cbHrQumF8iKfMCnIKDU6OeN+JZ2bEjaSWaL1azxpzk3sWxxZ913t7DtsV
         lVlnJ4bhehuTMkqXZiwggJFu3IoXooxwtDT3NhCHxrIGVCQv/+XVb6jzxBWfHtzabh+3
         EbvROOmPNv3Y4ldf3YbaafAj3nsH6IMbBvdcWtnUBRUoyCq13ltxQVQnJ/ETGn51Y8cx
         wvHQOaYL8jY2EoaJVzjpfldFlEwxdQrniQe37tUC2uf+7Wun4AIWAp22L+c4a2Cl2RbS
         +s9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jivhOMF2Dp5QIJkx8toAZguDtgmdufs2dThkF05/Cc=;
        b=8LDY3vBY003TXOWQklwwopukkHv/kLvMZSVdSAk0/D/lAzQaWWIPV4ImZ1H1arDjIr
         aLWKqhjii9XAUaNw96nPE/TTIjLngllbfXig8Z8z63lyqez5ZLKMD718zohOluA+FKL5
         gAxoHnLnnkX053Zzbyr8r9BZBzIFeNTpKQGCPW946IbWvz+BpqDCsHCzfyM7p/GyCdxS
         6uMeeVbrZT93MzSOtxVqI2W68KUE08dkoUj4IMKo96m0ytroL5bs8oud93WsbLa+Qfih
         qd6ASiAXu4gw8J2C/HAU2UE+NWmii2cr2F2C8VKhHssvlKAHcyQN1OcsoeNK9wzAzTAV
         8dCg==
X-Gm-Message-State: AO0yUKWw0MdJjgvEJpyOS/pqNEZhnsDXXrgI3ateiZaUNmmcaY7EESah
	E32S1gHWHjwYStzdqUz/gvo=
X-Google-Smtp-Source: AK7set8IdII9/ujkq6fv8gNRveyl1MOjV31vY9KaLeBL6Ky2dpNemQxB7223epsYE0anRCJQcS4yFA==
X-Received: by 2002:a05:600c:198e:b0:3ea:4af0:3475 with SMTP id t14-20020a05600c198e00b003ea4af03475mr17299381wmq.1.1678866448152;
        Wed, 15 Mar 2023 00:47:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c450800b003daf6e3bc2fsm4842127wmo.1.2023.03.15.00.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 00:47:26 -0700 (PDT)
Date: Wed, 15 Mar 2023 10:47:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Staging: qlge: Fix indentation in conditional
 statement
Message-ID: <6e12c373-2bfd-48d8-b77d-17f710c094f7@kili.mountain>
References: <20230314121152.GA38979@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314121152.GA38979@sumitra.com>

On Tue, Mar 14, 2023 at 05:11:52AM -0700, Sumitra Sharma wrote:
> Add tabs/spaces in conditional statements in to fix the
> indentation.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> 
> ---
> v2: Fix indentation in conditional statement, noted by Dan Carpenter
>  <error27@gmail.com>
> v3: Apply changes to fresh git tree
> 

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

