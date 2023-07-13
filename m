Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0964F1ED53
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 20:10:38 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so154338266b.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689279037; x=1691871037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yreGFvCmpHnziSDHuJXMrwPArv/PIvS/Cz4S/6XBN9o=;
        b=MQ8cTiSmhMxzzKWxx8hq7LNeFS3a7hWxrQdeumfh5bfeBisfhkQj4+bGg6+mtJBtgZ
         UGVHFc/SBdS8WepYaxgHqVYw1XK//Y9oPdUzYLhA6phUhFxgVzvwGdivLXc0AFWA7ZI4
         9rd+WiBHbA9opPbdk/do7WTcn4GwcFmsSm+DEMfTgd9wPKMsf1sg8WLwxyCA+JAf0YUM
         WmI26O1yDduxglzRuhiXAuE9EzJ1GjcCEpuOdWtWlKiB7rnUqmYwZoA41RJoxHBK5JKO
         nKtT/sMVbaYdpD3nXYeN0YfKQ3dG4yH0LnvzU76m5SjolfEQ+wtPHeRaaA6CPGeW0DM+
         BtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689279037; x=1691871037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yreGFvCmpHnziSDHuJXMrwPArv/PIvS/Cz4S/6XBN9o=;
        b=VfCzNKtGODB3lCOjCrS2nT8wAYKQNSyFbagaKqccU5XDsIcGdOxiqUBtkSR4aFzB7l
         L1eb1ZgBtPjL4iHSv9MpBFcmuU3d9P3Mm3if872GqVU2yBNijHaEHMBkH+m15zqkxILX
         rc7hb+b03cIvMfxDSCdiUN/xQ7yQFcLsylO0nTFOU+kL884FCrkwdRUk/J+IiVMgrpBg
         irzxtxmZd+nU3ZPtCr7ZzptEgPjE3ko5d/Zxaeq3nPXgJ7JSbBFGY5gmOvN7K7dUU8/I
         63EzveUGYFcklG7vsToIk6emh5sq+Illu2miU4VxJc+FNTXo3gdZa8UQd8nlcM1cs7aG
         Ck7w==
X-Gm-Message-State: ABy/qLaN2gkkk4QmcLCjI8VjaIVRKgasX1Fd+ECvyRhxKygIfnlh5P0w
	ijlv9YNSKLvYIe2LsjHSu0o=
X-Google-Smtp-Source: APBJJlFNGTLlZYUpz8EsCiTChVxpbGWOz7UmSy+UjyXaCRtqOEDO7oiQjxyK4Nn+vG63aWiegdD2HQ==
X-Received: by 2002:a17:907:6e24:b0:987:16f5:692f with SMTP id sd36-20020a1709076e2400b0098716f5692fmr2852136ejc.44.1689279036847;
        Thu, 13 Jul 2023 13:10:36 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id x25-20020a170906135900b00992acab8c45sm4450161ejb.12.2023.07.13.13.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 13:10:36 -0700 (PDT)
Date: Thu, 13 Jul 2023 22:10:35 +0200
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging: 7811: Fix memory leak in _r8712_init_xmit_priv
Message-ID: <ZLBaO2/p32h0enDT@nam-dell>
References: <20230712205733.29794-1-Larry.Finger@lwfinger.net>
 <ZLA1942ebuVcUT3h@nam-dell>
 <b684a76e-7d22-fece-5358-f459e4a979ff@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b684a76e-7d22-fece-5358-f459e4a979ff@lwfinger.net>

On Thu, Jul 13, 2023 at 01:51:00PM -0500, Larry Finger wrote:
> On 7/13/23 12:35, Your Name wrote:
> > The allocation was done in a loop. Shouldn't memory from previous loop iterations
> > also be freed? And allocation by r8712_xmit_resource_alloc() should be freed too.
> 
> Nam,
> 
> You are right on both counts. I will prepare version 2.
> 
> Larry

Perhaps you can make use of my WIP that I didn't have time to finish:
https://github.com/covanam/linux/commit/ee8a0719ec8535f932b30aa67325fc21ba998c50

(Untested and the label names are kind of dumb)

Best regards,
Nam 
