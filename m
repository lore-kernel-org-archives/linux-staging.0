Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E73FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 13:24:10 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id i21so28915182ejd.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 06:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZQjOz+ZZ81Ebb5EPtK1mTpOLbzJJlm8KGTxpSWS8pc8=;
        b=qYtqhg8m/O1lCKQKsabfArcZaRMY9k0MxVOLEDIImkDyUsUQcqwHHYO3I02wBagofO
         g4CJ/CkaQ9MYKHhK1Rag/COMV7aWzBYyqjJ/K8yWDgmTxN6vWtVqSXW4rqCw31LJk3sJ
         NnNrvc1fTaNlGNXvlnHoz8jMfd9P9qz2PVblm26V7Il1wOAsfmACxLqqUFVHkGPa0d0K
         occNgReCGrIz+tPL7NL9OERtSWof9C/I7UyXbCmLdOILHJqpIVtKvzHIm6KQowB/u0xq
         JKRWJ9VBTW9yD8fy7D5xZqwcu2NXYHqxo2bXghmexvU9g0c+A7tuuvNW2qrBTKwXmbNv
         e7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZQjOz+ZZ81Ebb5EPtK1mTpOLbzJJlm8KGTxpSWS8pc8=;
        b=6qOCzUKAxgLw+ddZkuwLNmEwXOQOpXbEzUOmcZc3ThGNB/VzSV0R4rtOur5x/j3Ptb
         sRSq6vqIqkOkCyxpjHmKNIlpnH6qFPPBypQFgIDfCEdPAl9KgJJbxD9oOEuZFSY0zHTS
         tENCpcFrCxmxCD3fuC8o1zcf/yg/CzCjb1z7CrjcUjomWA9wfTw0FN7qzanp5Y+SRiRs
         bM4up935ukboWKsUsSgbxeJ/cpjA0kOZp+L1mhvTOTnfm2ojdX59wc/tgyVE348zlyZj
         XtWjD4piozfh42NPSDBosXO7qoDXGyefvtBPr/huciyyO8iO/H/MueoORVASAcvL/hLq
         9IrQ==
X-Gm-Message-State: AOAM531Z4QNUgdSeSlauU/pI6Bwq5G2dIUR8zpJPrtAP63+sm+NPo+Tl
	xuEEyufUddgZv9gQ90Lzc10=
X-Google-Smtp-Source: ABdhPJyjBIUxZRK0NkYDdB1lV4Hw505+IjfjicfTiMb+15in7gxGkW5eFQAlERYZnJO4M0w1cr159Q==
X-Received: by 2002:a17:906:144e:: with SMTP id q14mr18627455ejc.19.1631625848845;
        Tue, 14 Sep 2021 06:24:08 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id gc19sm2152431ejb.35.2021.09.14.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 06:24:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v4 15/18] staging: r8188eu: hal: Clean up usbctrl_vendorreq()
Date: Tue, 14 Sep 2021 15:24:06 +0200
Message-ID: <1670478.viNvIS23Oo@localhost.localdomain>
In-Reply-To: <20210914092405.GB2088@kadam>
References: <20210913181002.16651-1-fmdefrancesco@gmail.com> <20210913181002.16651-16-fmdefrancesco@gmail.com> <20210914092405.GB2088@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, September 14, 2021 11:24:05 AM CEST Dan Carpenter wrote:
> I don't understand why you moved these from the top to the bottom.
> But the original was better.  In networking code declarations are
> normally written in Reverse Christmas Tree format, longest to shortest,
> like this:
> 
> 	long long long_name;
> 	medium name;
> 	u8 short;

Dear Dan,

I'm sorry that I forgot to thank you for the reviews in the other messages I 
sent in reply. :(

I also forgot to answer to the above question...

I changed the order of the declarations because David Laight wrote "I think 
you'll need 'reverse xmas tree' ordering as well." (copy-paste from his 
message).

As far as I know you are both experienced kernel developers, so I took his 
words for truth. Is it a matter of personal taste or Reverse/Non Reverse Xmas 
Trees are strictly required by the Linux kernel coding style guidelines?

I thank you very much for the time you spent for reviewing.

Regards,

Fabio 


