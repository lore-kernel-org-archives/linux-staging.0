Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFFD8F77
	for <linux-staging@lists.linux.dev>; Thu,  8 Jun 2023 09:00:58 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30c4c1fd511so362231f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Jun 2023 02:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686214856; x=1688806856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iob3eSoU4CsxfFKQ1GYZP4iOpsAcEYonBR1Gc08+llU=;
        b=Fjn4Yl3dmXI4VjFBQOQFr41m55z/IFEceS/hOsBpHTqM6pjdsoxhYbabAlVKgto1FB
         5mrdGIWFS8vjc5sviKP47eEtqfXALpLD87ZwVqWXARJc9JgN00GkT5ZxBaPmLJyx2MW+
         rqPZKJF7Tv9KqyjOjDNRjETASfsOXngsmkIFucrA6Rt93dJvG6jp81g3oFSxKOfblt1h
         xD0J+nqca7LENDM41xZxUS54dHJiiRtZyGmMUvuIWo4Ag1dBTEFxMS3hg65LKNhVurvq
         zlnqcXdRvGbiGTq+R3lySzHLuvA98dg5e2rwhpzkfYJLNipogFpGgNQ6D3HJCwoKO3BD
         XMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686214856; x=1688806856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iob3eSoU4CsxfFKQ1GYZP4iOpsAcEYonBR1Gc08+llU=;
        b=ZuPYOUvyic8RX46s2ch+DT0AiR3WU9Ak+mQ7eil35h/ZWqZItk7y1ChcgdyI7CEdzq
         HdCTmAHj/egrIObkaHRjnZeP4uYvtdSNKrYTrJfSTsopp1aOuCereHspbGYzGmigaVk+
         4TPzfJ3417oH92b1AOq+kKV04Ed4PWAq+VESbjTZbCSJSme9Z/7IXXvDhpWJQbM5xxIe
         RNM0DRTt2V1Kf7NM3YqY7Z9ly8m1QvJXxRhAmMleOdMCwKRjdLpyU7ktshb6+mbGpc7K
         7toOzRmtA4yi2K145tcnw29JYoPL5cgYAXK1sJXDfM9T+3UNsirMztWoaLb0jfboFSiC
         pXaA==
X-Gm-Message-State: AC+VfDxHWzqjvAb1Hv0XrqrP0CKysYfcnhyc0LoZMK0PlrR70u86D8VM
	19CXGLVMKYOVb1WBhYWw0RQIiQ==
X-Google-Smtp-Source: ACHHUZ4nDfPyBwWzeuff/DbHEhEWHZgfZxEonVLOFCynIzQ/dwZfXLNwWbK1gaqyHMA5Ii8TJa4pjA==
X-Received: by 2002:a05:6000:1964:b0:30a:f36e:72a3 with SMTP id da4-20020a056000196400b0030af36e72a3mr9785639wrb.0.1686214856392;
        Thu, 08 Jun 2023 02:00:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c024400b003f4248dcfcbsm4540554wmj.30.2023.06.08.02.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:00:54 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:00:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Yogesh Hegde <yogi.kernel@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] staging: rtl8192e: Remove variable SetWirelessMode
Message-ID: <c298a819-9d0e-459f-aa53-04634f28231c@kadam.mountain>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>
 <01a162c5-f0de-47b1-97e7-8a451a89df80@kadam.mountain>
 <90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com>

On Wed, Jun 07, 2023 at 10:18:28PM +0200, Philipp Hortmann wrote:
> On 6/7/23 17:07, Dan Carpenter wrote:
> > On Wed, Jun 07, 2023 at 08:31:41PM +0530, Yogesh Hegde wrote:
> > > The variable SetWirelessMode is set in only one place throughout the
> > > driver. This patch removes the variable and calls the real function
> > > directly instead, eliminating the unnecessary indirection.
> > > Additionally, the removal of the variable aligns with the checkpatch
> > > guidelines by removing the use of CamelCase.
> > > 
> > > Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> > > ---
> > > 
> > > v2: Removed the variable and called the function direction instead of
> > >      just renaming the variable as suggested by Greg Kroah-Hartman
> > >      <gregkh@linuxfoundation.org>.
> > 
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > regards,
> > dan carpenter
> > 
> > 
> 
> Hi Dan,
> 
> thanks for all the work you do. I always appreciate your comments.
> 

No need to butter me up.  :P


> But I think it does not work because this driver is divided into two
> modules.
> 

Yeah, you're right.  I'm wrong.  We can't break the compile.

regards,
dan carpenter

