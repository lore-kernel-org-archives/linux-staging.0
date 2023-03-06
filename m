Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F17E
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 09:13:16 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cy23so35383869edb.12
        for <linux-staging@lists.linux.dev>; Mon, 06 Mar 2023 01:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678093995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PnHL5h6qkSujzp3h/BFB5agr3fvMuSC0tzihY+nqGSI=;
        b=BPS5bOWWlYZiucIVPSe9mnoQJw31wcrfqMYZ27Ip9gtW9a1U28i/eEAJFJf9hqT5An
         BVPaiOQz0sENJXALXJiQX/C8ESdzD4NAATPh1Eb0XBsqQPXj65Eu2kpUkKBGP8soneva
         ZRiqnPt8BDEKZYVbW5ZNT0xIlj/qT5gYCGDlSdDJNPOd5WiuRRDSIUqw4YhZEdwzKMQq
         I/Ymd1RiuONjwyac6Y6UW/dd8h09/sJAhPtTCLcap2wMbN6Pf4/L6wi+2B0r30/hkZTG
         yl2JNMwKYYaMdJFgyyJ44SFrCkA7NI1LPmFckgF6QR8yBzOEssHnbsUD+ii32MIrJdCX
         f3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678093995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnHL5h6qkSujzp3h/BFB5agr3fvMuSC0tzihY+nqGSI=;
        b=vfGVJkFNeAi/VJAsSWPA4sm6V8CrUGNLOGsgfjPwHgeDcN/BCCUroTUPJOs7V7Je7V
         CKMaGpDxrd2XIjKsmUy4TaUlGdlch/9FsW0Sm5Mxt55GLDAEAf6QIzUsPi1n2n7ngKCR
         AHoAvehLL5suxVKrI8hLt8n7ge+XDYC+UaRqMWare8vO+ukCXgS2QL76CG/4KTzEY1c8
         EjEZ1XKrafokLFmR4CpgB7kfwXcZ5ZXJoZvjORofzRQI0tnA+O9V0H6JBXbjc9fV6uCt
         +aHHq0pp+vTj0RRXs54gWh4DEGdhkdtK+FM2JpA/C+cOxPHqq8lYgce/S5nL05oMGuCu
         JXKg==
X-Gm-Message-State: AO0yUKXnNPkN6FgtL3JM85uGYJpRogJu72xo3st/Juih/oUEROQ4m4Dm
	UQVYBAUM/Zb6/ejionp4Xoyhla1yx/T3BQ==
X-Google-Smtp-Source: AK7set93IVoMpLRC9HC2fzLXLSa69y6NBNULpgplajkcYjaYvTkH35a89MdScye9feryf3dzTBORHw==
X-Received: by 2002:a17:907:3f23:b0:84d:4e4f:1f85 with SMTP id hq35-20020a1709073f2300b0084d4e4f1f85mr13755196ejc.59.1678093995252;
        Mon, 06 Mar 2023 01:13:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906170f00b008c6c47f59c1sm4244971eje.48.2023.03.06.01.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:13:14 -0800 (PST)
Date: Mon, 6 Mar 2023 12:13:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8192e: Remove empty Array
 Rtl8192PciERadioD_Array
Message-ID: <7dba1dd0-3ae2-4566-a4dd-57b1f896d475@kili.mountain>
References: <cover.1678051460.git.philipp.g.hortmann@gmail.com>
 <e8842422d34fd19592047ad821c0dbe2eb4bcdc9.1678051461.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8842422d34fd19592047ad821c0dbe2eb4bcdc9.1678051461.git.philipp.g.hortmann@gmail.com>

On Sun, Mar 05, 2023 at 11:33:18PM +0100, Philipp Hortmann wrote:
> Remove empty array Rtl8192PciERadioD_Array and the code where it is used
> because it is dead code.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Same comments as for the earlier commit.

regards,
dan carpenter

