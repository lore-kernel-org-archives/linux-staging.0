Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A722F80
	for <linux-staging@lists.linux.dev>; Sat,  1 May 2021 13:54:40 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id j7so558315pgi.3
        for <linux-staging@lists.linux.dev>; Sat, 01 May 2021 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P4/PB+MgwhpZsD33KnvGfrSSkSWrWWTMYh1p5TuaVTA=;
        b=OrdyFym5r6zsR5nsU2yAr7bvOBNS9J1nJJEeN2l+E3aUIpc8or4Bqv3Pl0Oq6yRoFl
         p8qFtYxVL3oFFCudi6Ba/um5527tr4VugP4lv1rj9a8N7ppNcb/PNesk52LHdQgz58OY
         eSGL4kC4Y87sCPZyTm0gqIxhR3DhF1cCAFHU/s/Hml+Z+cXyVwFktZdQk7U+fO/sZDJy
         4yND8Gcj/C7CostvlbxlfqLPxbAO129LydeP09iyZ1DpplVGhMmLDG/c3T6mxeiMWlmZ
         sUcYHGOwptj648ciA4VehvobY6LwlkalMIew61r5MkGyN2lZEZLVXNbN4UVurrdd7PxK
         Orbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P4/PB+MgwhpZsD33KnvGfrSSkSWrWWTMYh1p5TuaVTA=;
        b=q3D0zGrZKZ1/qp0lCJ0eJc9cCbJfTgm+ki1JA6bdoxR9qER0ScEQyIu+/suRdtBkA3
         rr8Sxt0usK/yAgXpqJdkC14nBPTz+Tf3gTMMQQXyXb0iK9sEbxvQzFQ9JeWV16iVlouy
         jxHmGmJdqwaAuo167cIYARzyQ3ZvWDCxjr1EI0BOXDYGv/UwSsa3bZlFPGk8+6XbTzOJ
         OG0vopEhS08pSlZg1erJnlCj59Rgh/cmNJqhG5YgGnCY+wr+hwTF7gTIpisfx+XeWtzz
         d8ntYNN8C+J/FRSzXAXAzpt+rbDn1W8R7cUSQx7sGEQZcPBvNPmPOI5/p7ZCVoGgHLhi
         32WA==
X-Gm-Message-State: AOAM530oQx41CLT/IC8EprqnpHjeM1pd0vsCK3ifTV5tCvWbbKoQOq8O
	4LjYl97M/ecwiiSagYVsfV4=
X-Google-Smtp-Source: ABdhPJxB3RvO7ssVkKkP/x5VI661W9AuwTSl0sxEiilEPRKJ04i304i6K1vxncAuwc7ntAX/9Z+SFQ==
X-Received: by 2002:a62:de01:0:b029:28d:572f:45c8 with SMTP id h1-20020a62de010000b029028d572f45c8mr5791023pfg.67.1619877280195;
        Sat, 01 May 2021 06:54:40 -0700 (PDT)
Received: from ashish-NUC8i5BEH ([122.177.225.134])
        by smtp.gmail.com with ESMTPSA id u13sm5512465pgm.41.2021.05.01.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 06:54:39 -0700 (PDT)
From: Ashish <eashishkalra@gmail.com>
X-Google-Original-From: Ashish <ashish@ashish-nuc8i5beh>
Date: Sat, 1 May 2021 19:24:32 +0530
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ashish Kalra <eashishkalra@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Waiman Long <longman@redhat.com>,
	Pritthijit Nath <pritthijit.nath@icloud.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: silence incorrect type in argument
 1 (different address spaces)
Message-ID: <YI1dmF0vDfH6lZHu@ashish-NUC8i5BEH>
References: <YI098DQNtK3i2Fge@ashish-NUC8i5BEH>
 <YI1IMG8tCvvRMq3i@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YI1IMG8tCvvRMq3i@kroah.com>

On Sat, May 01, 2021 at 02:23:12PM +0200, Greg Kroah-Hartman wrote:
> On Sat, May 01, 2021 at 05:09:28PM +0530, Ashish Kalra wrote:
> > Currently p80211knetdev_do_ioctl use type casting to req->data to prevent sparse warning while calling memdup_user, instead of type casting it here, its better to change data type for data inside p80211ioctl_req to include __user.
> 
> Please properly line-wrap your changelog comments.
> 
> Can you fix it up and resend it as v3?
> 
> thanks,
> 
> greg k-h
Thanks Greg for your feedback
Kindly ignore v3 and review v4, i have modified it as pe your feedback
