Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8910626
	for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 07:53:17 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so4051534pjs.4
        for <linux-staging@lists.linux.dev>; Wed, 09 Nov 2022 23:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PqGMk/XG3aXOYy5I5CRkI+EonIV4UA20sJ/q6wzok1k=;
        b=FyeL2pd+UI7MXNEwJAJnHcObNqlv4Pgl5irbsPLFqazAx9LxifF+ZVvX0et0i2Mqvi
         3yanEqOnC31xYTPvCHqy455O0qghMpLaR3xe9vJCHAoAvW2T6QtRAen0zE4MS+2/oRnS
         Rlc3yftINmKl66/RbSivrPodoOknR9NQNOAL4K44WBNq1ymUvUJ6LPqZYQ5his1dDIyi
         ninZRiaML/1+W1mYvZdQC5bxdr6KzPCFYEtVyQQ+4a6RJavbe1G/DxUHbcD4GSDTbwqJ
         kda8juosekbFWRJuEJRzYQZgpQqYnJZVCnZSuObz0KoNZCQ1rnP7UAmvMhikg7FoUcYc
         8GtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqGMk/XG3aXOYy5I5CRkI+EonIV4UA20sJ/q6wzok1k=;
        b=yl2pmsicufnyjhW3xk6W1ZaAd+KpWPgRBiBN/s8EmeWv8SiB0h2Mg3DAp2wudJdC3y
         rIRvBRtLY2rXX2z1auap0rV9FfJsOMgnXNEQelee5qM/UY+LT4KK2HdnQ+vmVZ9GebuO
         zoYuIqEe+CFs+N4JkURdMrlp44qzOmhKnywCMN28OorR912Fe+F4MxrY6I1wZ9xwbWza
         K2sXMB1m4XNHfgLxMW5mdVk44S+fsBtAGdCS3OQr1dHec+KyawvcNpP3Hd6HVOL9rBma
         dt3Zk070zaS5jA2lnTY3dAl39JT61dRoOY+VqRhkoJcOMjmBnsOMfp901j7pJR+8/imK
         fy9Q==
X-Gm-Message-State: ACrzQf1c8L4n1B7I2tGN28m3nQgbd7zFDxnJGZ4B8E5OSxt8yFYty6z/
	wAXB5QejMTqD/TVcB5uOdMU=
X-Google-Smtp-Source: AMsMyM4Pl7aUvQSZw9rdxm1t+NMgI3bo4cIXFh45xCB1cjpczgGo3FODOtf4fi/KRXBHLRINk4950Q==
X-Received: by 2002:a17:90b:e86:b0:213:8092:e19a with SMTP id fv6-20020a17090b0e8600b002138092e19amr72906994pjb.56.1668066797156;
        Wed, 09 Nov 2022 23:53:17 -0800 (PST)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id o8-20020a655bc8000000b0046fb2a58f11sm8556376pgr.29.2022.11.09.23.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 23:53:16 -0800 (PST)
Date: Thu, 10 Nov 2022 18:53:12 +1100
From: Jacob Bai <jacob.bai.au@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] staging: rtl8192e: rename r8192E_hwimg.c/h to
 table.c/h
Message-ID: <Y2yt6ERX3szKn2W7@jacob-Ubuntu>
References: <cover.1667723306.git.jacob.bai.au@gmail.com>
 <9bb563727915e3f3edd863837608336b99564462.1667723306.git.jacob.bai.au@gmail.com>
 <Y2p0dNLBqiWFPzB9@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2p0dNLBqiWFPzB9@kroah.com>

On Tue, Nov 08, 2022 at 04:23:32PM +0100, Greg KH wrote:
> On Sun, Nov 06, 2022 at 07:31:17PM +1100, Jacob Bai wrote:
> > Same as other rtlwifi drivers, use table.c/h.
> 
> You say what you do here, but not why.
> 
> Why rename the file?  What's wrong with the existing name?  It's not
> causing any problems, right?
> 
> thanks,
> 
> greg k-h
>
No, it's not causing problems. As we are trying to move this driver out
of staging folder, so I checked how current drivers naming
files/variables, turns out they all named those two files as table.c/h.
Maybe we can do the file renaming as the last step.

Jacob
