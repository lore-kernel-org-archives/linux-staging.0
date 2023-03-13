Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A915CA;
	Mon, 13 Mar 2023 04:08:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id l12so1743993wrm.10;
        Sun, 12 Mar 2023 21:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678680484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXawRAIx6eV02ZRwEf548kRyk9SYqMQfx4NlySQytTE=;
        b=T2Mu5LLg9zR4w6aWywuDnjoLsVB4yDtMBxPBqdwyxu7Nt2WOi1/kJhHzXtcvqybDGS
         5iDfKFaICH9zfDB5doQqMk0bS0uReZ8kocbni52uHh6vpbFuBSAsHGslHd4LjJdfvGtM
         DAYERWYHbYlgXniKC+RtBXtk/vziyUng21FAAXzzEjPa+9nM4REORWAR/m/K/xCMS8nu
         hZ61EmbfuuENAc0TolbgpAvyCFwp9CNMubIGWRwV/dTmChlHBlk6YQ295ZoQCLImkAGY
         7qQQ8eItjIzLhB0GhGhQnNy5uSEToLu3sbOpARRPhxlGcV1P6HWWnUUl/jbxztILHNeO
         V9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678680484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXawRAIx6eV02ZRwEf548kRyk9SYqMQfx4NlySQytTE=;
        b=Po+Skz5Yrnc7RvLQfBDUH1aA6pJoOO63LYjuBQkNVAdgk889IZ8ws3tK3wrWU1+W93
         u8QQQuf6QGl3tAioF9suvYbbl0wCu/JVjalX8ly/waYy3uvfo1rUn7rIUxI8tVSFqhIF
         PxRrAEPo7qPUmu9M+RK6bqJ1fTK7wuYaLRiquxHr9ignv00c00gOh2e6UMRcoZOGCNQw
         IWE3FgtY92gYtdXrl7p3Z07f2uamNcb3130v5DAkgLKj8bU5RfHfTUbTCjXnipgybsp8
         Ux79AXapFs8BO63gAzA8da4QKN7CauAlQHxWpAr92rKZMUz5sj9Yl5L6UWPzxp98DYTK
         Nc3Q==
X-Gm-Message-State: AO0yUKUmvvQ3m9N7mO9as1bmrTt1NcUfgijiyQVG/M0LZYcsbfMUMfrv
	Zc06USOVmeKZ3//Nf5pe/6Q=
X-Google-Smtp-Source: AK7set9+WsyZG21rsmESra4j4bSnsngTAgejgwTYjtFpDitqwE9s2K61t/ygvGVNn18m0Falc0sVfQ==
X-Received: by 2002:adf:dbc3:0:b0:2ca:e856:5a4 with SMTP id e3-20020adfdbc3000000b002cae85605a4mr6552429wrj.26.1678680483923;
        Sun, 12 Mar 2023 21:08:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x1-20020adff641000000b002c70c99db74sm6639829wrp.86.2023.03.12.21.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:08:03 -0700 (PDT)
Date: Mon, 13 Mar 2023 07:07:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: outreachy@lists.linux.dev, GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	manishc@marvell.com, netdev@vger.kernel.org
Subject: Re: [PATCH v2] Staging: qlge: Fix indentation in conditional
 statement
Message-ID: <87174bba-201f-42f1-9e36-5c330351201a@kili.mountain>
References: <20230311172540.GA24832@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311172540.GA24832@ubuntu>

On Sat, Mar 11, 2023 at 09:25:40AM -0800, Sumitra Sharma wrote:
> Add tabs/spaces in conditional statements in qlge_dbg.c to fix the
> indentation.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  v2: Fix indentation in conditional statement, noted by Dan Carpenter
>  <error27@gmail.com>
>  

This doesn't apply.  You need to start from a fresh git tree.  Please
read my whole earlier email again.

regards,
dan carpenter

