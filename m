Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4C7B;
	Sat, 11 Mar 2023 04:16:26 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r18so6837822wrx.1;
        Fri, 10 Mar 2023 20:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678508185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MZ1eeqmPCIB2yO855GUqLYB3SG0cWG5CCnQ7/1cNu2o=;
        b=jIeJIOLLGVVM5N6JHLEMYkKL8y0bCVrSEAoj3w9Nk0tZZwPHhGIUETvgT9NRDX6Eqx
         +dRwM8+zAyfC+63OgUu0a4V3n4qewOfUUWr5fr9/OiDiRbCmUYzZXeq40vaosk/49V0U
         nTBSi1TN7JOgdPMBSY7qUAvZCB9FGlsILQZV/7HEka7funKPNBWBDT8HyKkfTTmZ6jmC
         Hi8nYMDsp57VlxGuQ5Fz+aRgMKWNVumZ3eDkFPCG/TAVnojyd2NlSyfxhhkOoIkDpECK
         JVMntykERbTfBC1hHAOgANseFkoR3ZG0vDQGKZZ13N8qgWYhChUrf12c9A8WrExE2IhR
         eHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678508185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ1eeqmPCIB2yO855GUqLYB3SG0cWG5CCnQ7/1cNu2o=;
        b=0hgLBfgWF/5B6hKGPb6NausRER7FZZCOpVNp9WjO5UEtSb3PMDHg6sSBIi/sWCXUgv
         3Ugf+BAvAlLP7hIuJiuJ8hqWuREXHI3MYHxgDBNeeFKH6lpDX8Xo2ViIv0w7KuIA4ppR
         fMYVI2rMn7M1ZFfEeeC8NxFoYCt0O0gLpZ4z5FdwYXqK9Sak/7N6jsmRsXKv1tWB7VuT
         pIEEbZOZqLaO5neaHZwjODVrP+Lm/fFL+qE1Cu8wsBWdDWUQBV0dn07qhBd1s0zGs26s
         lyanIgGykL6mh/aHiWjyUuRUyX2k3sZyCa+33sIQPh1twOGQedni07lbWCi+ctJcjfHb
         lHjw==
X-Gm-Message-State: AO0yUKXIHVRJ07lnTfU6xwfiicWO3sPbA+r6oevY7BzIDa5TGV1lK26u
	NK65RS4dO0OiUjwuFgzUoXI=
X-Google-Smtp-Source: AK7set9wqGdBLke8/AXSOYkqEqTSGAiOyaNSJkBw2QuiXFdlDlX1JGE/Id1kDqIXO1jD2BPpFlwflg==
X-Received: by 2002:a5d:5410:0:b0:2c7:5ad:9c69 with SMTP id g16-20020a5d5410000000b002c705ad9c69mr14484486wrv.71.1678508185051;
        Fri, 10 Mar 2023 20:16:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d4105000000b002ce92af57b2sm1316961wrp.42.2023.03.10.20.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 20:16:24 -0800 (PST)
Date: Sat, 11 Mar 2023 07:16:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: remove tabs to fix line length and
 merge lines
Message-ID: <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>

On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> In file drivers/staging/greybus/arche-platform.c,
> - Length of line 181 exceeds 100 columns, fix by removing tabs from the
>   line.
> - If condition and spin_unlock_...() call is split into two lines, join
> them to form a single line.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
> Changes in v2:
>  - Change the subject and log message
>  - Merge if condition and spin_unlock...() from two lines to one 

Apply your patch and then re-run checkpatch.pl -f on the file.  You will
see the problem.

regards,
dan carpenter
