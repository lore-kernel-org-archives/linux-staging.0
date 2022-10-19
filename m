Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89E123A0;
	Wed, 19 Oct 2022 22:35:14 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id q9so43344990ejd.0;
        Wed, 19 Oct 2022 15:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4g2WGpfHQynp+rFhcmOPjXRA2g+YdubJZg4hG2W5kJo=;
        b=YK6Mp9KoAJifBMVTBpjdQPsWsAQ+MADcn7Tbk17EFljc6WYgMP2Jhw87Gmds1miK1Q
         6C04jfiteJq24pgwyhPmwPRbId6Ms+FEMLhywKu1rYai+6hKJmQH00l5/W19emHa/UrK
         fWwqr206553/f8QhAEpW/HVZJ/LeJcxJSiu8qSCHk68QPtGAqC9OK0ww0nzyo14NzeFH
         v15rZ9CHDxW1AtvS+96WurNXaiAnupvUC/AmzryZ8OwJBgWiJzMvEFNo4fH4+8BtaDLl
         H1svU5GlzK8qjMfR5zjtQlK2B7fzkt2UvARjd/GwW1v5xSxya/MQzQ5UZ6tjy5lssbsR
         DRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g2WGpfHQynp+rFhcmOPjXRA2g+YdubJZg4hG2W5kJo=;
        b=gHl9b0mxdqGS056mcpS7ow2essnGZrAwTzHv7CTtBgRj/4excI/WezVz/OwY0GbECr
         sllN9MytQPmudfADapgcPscpDnGlZ+32mkLW15K8C6e2s1edsLSJSipF6TqJgGzUuTn3
         zR89F/RJYQFU4oRXBuCbtTv6WnfA5iaZBX7b8xnc3+E5EJcOA+ibUzC6BMoz1XhJa5wk
         Ubg5hMF+7T8IJXzHXm7swc3VFrJNZ4y+K31Kz5gPABJciP0cP0waguAaKELLe8dCuLk7
         YAUfPOStj+Oz1LmWxOLz+xREPe17TrOLeeO63Yu18kQIeFQ6uel424+H8hpwKkq2MZVa
         3FuQ==
X-Gm-Message-State: ACrzQf1S+BDXf1T3kHtoYZ1XmvmXIuE/STVgjMwU/IBtLVfkAnT3jJLC
	XYRi9uEAZZiKPvozFhc/kQ4=
X-Google-Smtp-Source: AMsMyM4inb7j1xMefkrU37SzXhA3wgqBpTCz8Yjzn+mE3QBReAkA4sTQspgmI8/MI8T4Q5u8nFpdvg==
X-Received: by 2002:a17:907:6d29:b0:78d:d12d:15af with SMTP id sa41-20020a1709076d2900b0078dd12d15afmr8633082ejc.53.1666218912806;
        Wed, 19 Oct 2022 15:35:12 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id h28-20020a1709070b1c00b00780f6071b5dsm9264413ejl.188.2022.10.19.15.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 15:35:12 -0700 (PDT)
Date: Thu, 20 Oct 2022 00:34:46 +0200
From: Nam Cao <namcaov@gmail.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: greg@kroah.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655: Fix Lines should not end with a '('
Message-ID: <20221019223446.GA154747@nam-dell>
References: <Y1BN6wPMrpxPB3qP@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1BN6wPMrpxPB3qP@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Wed, Oct 19, 2022 at 07:20:11PM +0000, Tanjuate Brunostar wrote:
> Code style warnings reported by checkpatch.
> Improve the layout of a function header:
> Put the first parameter immediately after the '(' and align the other
> parameters underneath it.
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> 
> ---
> v2: put static and void on the same line and adjusted the indentation as
> suggested by Greg KH

I think he meant putting "static" and "void" and also function name on
the same line.

Additionally, I think your patch introduces new checkpatch problems. Did
you run checkpatch.pl on your patch?

Best regards,
Nam

