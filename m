Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0929CA
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 23:39:18 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id e12so2693063ejt.3
        for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jSSGxQ//DnMRsJRUYUjeRB+lpCXCqxwfcmj0WWP0ZvQ=;
        b=fwIC/9VxhsE1UKcqjrwZqMi8a80vKG2rurB0ztzuC6G37AOEGHVeCFgCilHurbZ7Ac
         Xy1M22eM75dD09gcRNzz5sHhN5ZXwRft/VTqL3MsTqgqob+arnp8kTgGb2/y93jeppKA
         6qhhRLhTGXUzECxIG5HIu9SvcZFfnYm0cgOjleUAFC/nqjYRgJ+uBebTKkDx5WcZM7vF
         Q+Fl6ELoXaRxWfEdfNybUniCdFAK4orD8pnoILTW118Jh/nBOv6/urnKmctBIkec/mx1
         dYiy7qmjrobwfnUJFj1jMerR7rXhh8jgJSu8CRErPUepR1r9afUqhqm3gELBz2IE4DFr
         e12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jSSGxQ//DnMRsJRUYUjeRB+lpCXCqxwfcmj0WWP0ZvQ=;
        b=r+GxnI7vBA7zJc94EKT7iFk0Bc+kRvtIKwCEK8o7D00g9JbSqvCei87jb6PXRGfZXp
         i06nVKZVQLuqcz3fMcmwjT0pf7ivcdu24zRmHRbZGUUP9PjsDo+AkvjJBocg+prDcUBb
         pIUunGbK1ANK54IrcuR/I04aur0E5NNlExsTnB4yk3IduSi/wJucbFVMlv/G6Jb+axJC
         i8QMaefI5sItusS7XnkpKBRhzhnVqbmXAPo/D9KyMsh+DgC39n4QXOpEqLGyk3qHNiUz
         r0/czC+K1uAT8lYR+v/pN94M39ET85Mu5xNmaC39avptWQaHXGJkWRZl+ChIfhqIPf8X
         x5qw==
X-Gm-Message-State: AOAM530xFedOfyKjfhSBvmh4qfvT8+MRY2j/c7IHR9BInBBkDL6YxUpx
	WsVqND6CwBqw21A3pOFLzaiUZncHLe27sg==
X-Google-Smtp-Source: ABdhPJyuhHOTqQFI/pfxAJQtL8hupVbU6kvHmbWtQQctWBgQrhWcb4yFQwue3M6pPYZAJ0lhDTbz9Q==
X-Received: by 2002:a17:906:bcf9:: with SMTP id op25mr6533209ejb.453.1622158757207;
        Thu, 27 May 2021 16:39:17 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id bx21sm1839563edb.64.2021.05.27.16.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 16:39:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: drivers/staging/greybus/bootrom.c: fw is NULL but dereferenced
Date: Fri, 28 May 2021 01:39:14 +0200
Message-ID: <2015099.xVv48VzNit@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Coccinelle detected that fw is NULL but dereferenced.

static int gb_bootrom_get_firmware(struct gb_operation *op)
{
/* lines of code */
        if (!fw) {
                dev_err(dev, "%s: firmware not available\n", __func__);
                ret = -EINVAL;
                goto unlock;
        }
/* lines of code */
unlock:
        unlock:
        mutex_unlock(&bootrom->mutex);

queue_work:
        /* Refresh timeout */
        if (!ret && (offset + size == fw->size))    <--- here
	next_request = NEXT_REQ_READY_TO_BOOT;
/* lines of code */
}

I really don't know if the following change may break something else:

        if(!ret && fw && (offset + size == fw->size))
	next_request = NEXT_REQ_READY_TO_BOOT;

So, I'll leave the problem to the maintainers or to other people who know how 
the driver is supposed to manage fw == NULL.

Thanks,

Fabio


