Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77062538D;
	Wed, 15 Mar 2023 14:22:44 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id fd5so42356459edb.7;
        Wed, 15 Mar 2023 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678890162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yyMDQCOfBAZusZX5jSmhyE2oTgujKm5FjLZ6IDt+eWw=;
        b=Lhf966giEYD7DdgGJ+Tz1IuYvaioY68FS6sfbPCAREGADGZFyDV32s+eTuDrrgcreZ
         mi/qz9Hn+sfnFj9f9650ii2tB9jHqfi2hZJzYA+x2lYPGk0HtgOqilDYUykpypoxF+2P
         tn8nYH/mo6sUqGyzdxzURP839qlrCT4V4CFcSQiiRsQQkO+ESY+zWwJL7eIrolvamIFO
         VJq5uyb5YtxoojAAo40Q/bwdDkJMt8s3laEDaukNqI13/Ds8aRIaLn0WsFv+kMN/nkAu
         +cLZ3g1t85lsHNczlGLyWzleyyS7W5lVNZNjO0fEsT5Cjcml9Pf2NFfJg0IKh4M1MOiA
         +pHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678890162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyMDQCOfBAZusZX5jSmhyE2oTgujKm5FjLZ6IDt+eWw=;
        b=4p+f7mHiAABJAbvDl5/RNw9WHQYnCin0FmUegMldaVu32sGJGQ6CZtk6LLJF6KW7ll
         dU3PEwoCU5ppnoYWtFeX/9op/wECPiYnjJB88A/KVzK/1RVGjPReZOmqTAj0oDfb0/xV
         S6Uc7YtqWPpuBGjInH+HgtoIZYH5UMYs0VkfTVXQPKRw89tDCHkyxkkgJCy5vnEntkW/
         t74uRjyGRnV/5XrM0p3mniWjc6tQET3nBJ9Lf7a8iQ0ktdsW+4qmY57m0V2lOkD26/uH
         VcYiV1X3GdSDs25uejjPLGmCItxA9/awQqXxburOARS0s2mAOPgsu/kuQu0dfEh8Ows0
         OcwA==
X-Gm-Message-State: AO0yUKXsvFWeC3IT12NaHzET6MbJaKxvuscvldBXW11TfkVHTJeQPZI+
	epOsDDxgQEqdJYqIXXrhxeA=
X-Google-Smtp-Source: AK7set/cq7DV7NTF6kHldxZalTeU1yLLUdwXpYOBY3rGJHSRtrA5447S7BksGJ6MrvGukEvzmE+UHA==
X-Received: by 2002:a05:6402:4d1:b0:4fa:ba60:8188 with SMTP id n17-20020a05640204d100b004faba608188mr3149556edw.8.1678890162551;
        Wed, 15 Mar 2023 07:22:42 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id 18-20020a508e12000000b004fa380a14e7sm2531501edw.77.2023.03.15.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:22:42 -0700 (PDT)
Date: Wed, 15 Mar 2023 19:22:39 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBHUr7bANuhnOnIV@khadija-virtual-machine>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <ZBEJ+8DbhADSBTLr@aschofie-mobl2>
 <ZBG699SriXWy1I2K@khadija-virtual-machine>
 <16148020.1MiD057Pog@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16148020.1MiD057Pog@suse>

On Wed, Mar 15, 2023 at 02:34:31PM +0100, Fabio M. De Francesco wrote:
> Aside from what I said and asked for with the other message of this same 
> thread, please take note that you can build a specific module if you prefer 
> not to re-build the whole kernel and other modules at the same time. 
> 
> I'm pretty sure that the instructions to do so are in the OutreachyFirstPatch 
> tutorial.
> 
> If they are not there, please let us know.
> 
> Fabio

Hey Fabio!

In the Outreachy FirstPatchTutorial under the 'Compiling only part of
the kernel' section there are ways to compile only some part of the
kernel.

I have tried using "make W=1 drivers/staging/axis-fifo/" and it says
'nothing to be done for'. 

Should I start with the steps to reproduce? :'(

Thank you!

Regards,
Khadija


> 
> 
> 
