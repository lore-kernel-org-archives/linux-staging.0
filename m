Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57187B;
	Sat, 11 Mar 2023 04:42:07 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so7443208wmb.5;
        Fri, 10 Mar 2023 20:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678509726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4YQ71uLbPQ+0NSiHPqb24cst2BHjUEN6kSJWZmwaWJo=;
        b=Bq8b7mTIFzwHOwPOde1GyJishXztXmfsitoRQ3lhua+7pQ9xoFSHPP85xUHQs4cx7A
         hiOt3Z2HxMZEwFUne6RQi8y6F70kb69ZDmsH+EonYYVcKKvsczTPmM1aXa7PMLqj2SMo
         U6tBXi3xwJ69RyWDcNSYUy310EOc/cp8RdBc44Mjkg5O7pbgmFkw5KX/SpocBQwwYNcc
         wU5oKYU6OWseS5GFapKxK6HBd8jI0xkk1iZeJwE7EXDJC17s2sn0AIPJtMfEbnR0qwA2
         ugZDXT/7Tk7irL1CEAyT+uHIzDiWNp77x3nrcoq6N3oaAJxoiMYfuw4WXzt+Njre0+/l
         o+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678509726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YQ71uLbPQ+0NSiHPqb24cst2BHjUEN6kSJWZmwaWJo=;
        b=vHq7+TpNIG3PDd762GnwGH08lqhFNmanfiZUi1f0eyUZnn+TTbe5gjk3iu+Ob7W9Y7
         d7HAT3W8TdYKXhD/k+c7/+VJ+vp0Fy5I4YkkSIyZOHqgy4UaFQn26mWSIzJzdK5DNPw7
         W7ZZKW25kbAl0mubRLJE4alVMFhp5tKVsspq1QeZEDVeJSDUYCrf4z1AGqaN0dKGR4pG
         9VHqlcQbbjKpW5RRbT5ypImHvTGPCJ2LNJ59w4yoAEJ7C8+LtjEOstFVTKCddGuPTeVg
         SZWSogmp6Ww+x7WX1peGpzaCV8BK0L0l9hwSp/eg68nSH0FQt2NzRqpA0J8lljlFmCc6
         cMLw==
X-Gm-Message-State: AO0yUKUMIxX/AxXK8n1EDQJZoVp34NOQaNR3+G5FSHqfotbM/FQcFFyX
	GkiJ13TueZ8uRqTKxLlN8EA=
X-Google-Smtp-Source: AK7set+8ZlNuTVV28ZK4blflxk3xqYb8clby4Wi5OWnXuV1LVCofgaa6vYSpcPg0wHG8AFB5IfmBhA==
X-Received: by 2002:a05:600c:3585:b0:3eb:2b88:5af1 with SMTP id p5-20020a05600c358500b003eb2b885af1mr4727616wmq.18.1678509726074;
        Fri, 10 Mar 2023 20:42:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k26-20020a05600c1c9a00b003dfe549da4fsm1798671wms.18.2023.03.10.20.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 20:42:05 -0800 (PST)
Date: Sat, 11 Mar 2023 07:42:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kloudifold <cloudifold.3125@gmail.com>
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750: Rename camel case functions
Message-ID: <ba534c24-83ed-460d-984d-e915e090aff6@kili.mountain>
References: <ZAvk8SGjwdYlHEU6@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAvk8SGjwdYlHEU6@CloudiRingWorld>

On Sat, Mar 11, 2023 at 10:18:25AM +0800, Kloudifold wrote:
> This patch fixes the "CHECK: Avoid CamelCase" reported by
> checkpatch.pl by renaming camel case functions in
> sm750_cursor.c and sm750_cursor.h.
> Modified calls to functions declared in sm750_cursor.h in sm750.c.
> 
> Fixed issue in [PATCH] staging: sm750: Rename camel case functions in sm750_cursor.*
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> 
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> ---

No, you're going to need to resend a v2 patch.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Please slow down.  It's explained in my blog, but you should not send
any more patches until tomorrow.  It gives people more time to respond
to the original patch.  Also if you wait until tomorrow everyone will
assume you are testing everything overnight.

regards,
dan carpenter

