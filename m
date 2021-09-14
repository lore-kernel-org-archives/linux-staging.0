Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A43FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 14:05:49 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id jg16so29196414ejc.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OStgA6BGSrOeE1owL122sV6WqITjN7ZcXrkuShEwznM=;
        b=QTglR5JMNhQx4U74zOjBwL5GtZPbuguosufJf1OEwvdzXd71mgIbk79C9X17SpLpnr
         dkOQ1hdfBND+joZ+ff5itcSMDjtz/deZV8ju4KBv0HrLMOz4fcFbs+Av9qveWldjVTK1
         owHg/bu2wpMlohAOXkf96a+5V/zdFGUH/jt2PYRordSNObXYnAJcoFRQmyaT5LxQhT+g
         yv00OArrQ/W2Q/16sN4NXdiP9v1L4qDgs+BqNv6NqGeL5slUPQMMA7lqKk6nBJMDYRoO
         WpczNipIffKWE4bvgZ7JtZEDbalRgdiC0+diAd/UcyJQgU9b0QwMth9vFzytepXU8q5g
         5RkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OStgA6BGSrOeE1owL122sV6WqITjN7ZcXrkuShEwznM=;
        b=uS5jZk4AkK6d8SlVCTrMdiJx5GLL1PQ8LjERnZ68PDqk1Xg3OPdkyCRwieOKZBiP42
         jfo3OsiDXY5CRjsYlcLARmvfZMZropcUnGMq5vRCUZ2qhc1rJ3nh4qQyuIqQxdg4Apk8
         kdy08x03/cy1IO67J4n8wsVC9kbONAfSFQ+wk3r1NduauOOnItsMlMqgm5DelP2aDcTm
         FA3Sdzfv80Srch8gcE9U7r3Uua8ywQctPppF8xaI55G2aZ5SGhGzdGeFIGEGv5T0Lw5C
         P4Q19Moj9cdP89CXr3VBRmMS+R8v9FSrQpBvs/TSpd67y6lvRayW5OwQHlBV/NHxwLld
         +mPQ==
X-Gm-Message-State: AOAM531H6WwuHcjHlWHj5SkYZPBoIo0kMmuZWe9S1cj77XlQS8/u0zVh
	JoA0zLUtO6bzeQGVo+U9JQ4=
X-Google-Smtp-Source: ABdhPJyA8xP5SMNVSUzytDl0/3rJYZPfHu3iQNtsEaQY0luP5yBe9fqh5Ox9Y0AgSdcAgX7dORNaAw==
X-Received: by 2002:a17:906:32d6:: with SMTP id k22mr18775395ejk.228.1631628347807;
        Tue, 14 Sep 2021 07:05:47 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id e7sm5996134edk.3.2021.09.14.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 07:05:47 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v4 15/18] staging: r8188eu: hal: Clean up usbctrl_vendorreq()
Date: Tue, 14 Sep 2021 16:05:45 +0200
Message-ID: <11594204.TA4nE9Oavg@localhost.localdomain>
In-Reply-To: <20210914133007.GE2116@kadam>
References: <20210913181002.16651-1-fmdefrancesco@gmail.com> <1670478.viNvIS23Oo@localhost.localdomain> <20210914133007.GE2116@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, September 14, 2021 3:30:07 PM CEST Dan Carpenter wrote:
> On Tue, Sep 14, 2021 at 03:24:06PM +0200, Fabio M. De Francesco wrote:
> > [...]
> David and I are saying the same thing.  "Reverse Christmas Tree" vs
> "reverse xmas tree".  It's like an upside down pine tree.
> 
> 	asfklajsdfljasldf
> 	asdflkjasldfjal
> 	asdflkjalsdfj
> 	asldfkjalsdf
> 	asldfkjl98
> 	lwkejrlw
> 	ljklkjl
> 	lkjkll
> 	kjld
> 	asdf
> 	x
> 
> regards,
> dan carpenter

Oh, sorry. I interpreted David's message the other way because it seemed to 
me that the code already had this RXT style (with the only exception of the 
"wvalue" variable that now is gone forever). Now I see that I got it wrong 
and that something got lost in translation.

Thank you again,

Fabio



