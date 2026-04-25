Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F511EF09B
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777108947; cv=none; b=YKCU7LP9NVzXNOYPeBf6/JUxtYQMKRrOVsioYEojogSxL2gVpNoNj6Epo0xpcVwEkpzlHTA1IJAsSs99gJQfuq15J2BWb3+tq9XvLdVK5WqcD8Bz3zkVC2mZPZJ+RjX9FzrHhC4gzHxhX9jCVqEjKCzCPlv8Ikk4A5mblWR5rHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777108947; c=relaxed/simple;
	bh=YAOrwK23LUg+JJJYB9ZtR9kRRbz+zR4NeXlV+nHREXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHhygbU3JD7IqMYjmdv3oqSJ1bHhAm44tll8S2oQSLjnBJLbaCIGnpxa76u+jQQOszgETOHnbXJg3SSYIuMstUHyP6Jy51uvaMf8/ItPAxgMMSrnMce9ZbOXiS17ymQKOMVoG4CegFen5YY1v/dC5clZO5FYL3/9YBQLb2Bd+o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfgX5TGk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfgX5TGk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b150559bso68359615e9.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777108944; x=1777713744; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+p0y9isdA3C9/o+vuLOkdVYVxWEY4KLlrOVODzqycE=;
        b=gfgX5TGkPrC6u7pCJTqOLi/1jBIJagGMZ+lXBKQiDt/7PaZQEMc8TebLhRdsWdcshH
         NnUfqSUYcgT0/PQzfOXAzLp4BaAAOYsk55FK123pdXMTZcZmrUHz9h4m9KQpt71EcNTJ
         x7vZF6Ojs4Q4eA1aMsutcUiVgbrDkHIqIKS0t3O4uujn7+bO9B2xPRiW3jcjC6s2JYMh
         nMW7M84a6CPfNaP6qwAKO9i4HZ+vkXKegDsqvuJ2Wnqpyt7gYvhq1zmgRPWUk7tyFDEg
         ajqJgzk3DYvNXx6oaquzSsly/Peq7EZoZex3JcjSEolu4Ams4UvETDxwGiDYHlBXEzIP
         KwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777108944; x=1777713744;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+p0y9isdA3C9/o+vuLOkdVYVxWEY4KLlrOVODzqycE=;
        b=EKzUVj3jUgRyZcwGx1QKov4dDukWU3ChWBky8fnaYTPaxrfEdjEMztoU6pt7JNe09p
         DQP6Bxp+KGhkBBpKUjJxoBBJgBDcn6n+2xWmBf6L5+K8M4XFwRj4lIELnodDdvy9uqwB
         ptP8AkYqA7lt8iHLeLWimpaxr4R0TY7PC1TUpgzxeBZ3lO8HCPPzrEUCdLwrWweNsq9J
         faWzcaaEacvdgcsQd38fSj0GZqyqLH0HNH/Ix6kLb8ndlO/RPPyAxOMcJuYPoHAziuoD
         cbYhi9RvQ5biBjEPjrt8iS6InvUgUtCalXEcSfDeXF9SgOGLNGw8Wm7OIuRN/wVnSeu+
         7JGw==
X-Gm-Message-State: AOJu0YxaKWWZgIdDLHWy5pXf/kx9SEvzauG4Pfw5TDV/YfhtZ5dCeNQG
	9DHnwG4ZYp6tCaaoCxNA/9H8ucim5Obxo7Igvmo3/8oVa79WJv2abfKe
X-Gm-Gg: AeBDievln5l2e8usiwlCAmYStqhxmiwj3cZvhhSOS3uDNtRNR6wzsI7BMA8plYajvaN
	XD7iNegugDr9eyGGZNiKbThxl5Aa4AAISjBCTTF7UsmBYYlGM8+KrNARpbZW/TT+p/oBi00aAkF
	eLnKU/ciEzY7YtN1/WCLSOYffpbTCM9qT1T3kNuTUhrxnJZOc4DrtU3lE+Ahj4Jd13c1pNPakWE
	mJk9ADkEs2J6JOOtD2FmUTkYpAoY87FBStChQZtR6BGf77tZhk1c97daGd5XGiAfQe7bZ927C26
	vu+HyLXc1UxcYiycVfvcPZ08b/K4aJtSBj/GpMcXWs1KYTFQCh1LDnKf2dWlMDwOaOqrNujylzj
	LQnmrP22TercC2T1Vbxt7W8O5h9TrW/P/esU053CymmDlvOydtknbsREjCwmbrAOH+T5z1khIO/
	k0Gdw/bhlP0xZTYKssqYxLTNoex53yjA==
X-Received: by 2002:a05:600c:468c:b0:48a:56d5:16f2 with SMTP id 5b1f17b1804b1-48a56d5179amr279500255e9.7.1777108944092;
        Sat, 25 Apr 2026 02:22:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489fec8f7cbsm360176945e9.11.2026.04.25.02.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 02:22:23 -0700 (PDT)
Date: Sat, 25 Apr 2026 12:22:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: gpib: Add National Instruments USB GPIB driver
Message-ID: <aeyHzI1Xe_AIjTSG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dave Penkler,

Commit 4e127de14fa7 ("staging: gpib: Add National Instruments USB
GPIB driver") from Sep 18, 2024 (linux-next), leads to the following
Smatch static checker warning:

drivers/gpib/ni_usb/ni_usb_gpib.c:783 ni_usb_write() warn: set error code if 'usb_bytes_written != i'
drivers/gpib/ni_usb/ni_usb_gpib.c:882 ni_usb_command_chunk() warn: set error code if 'bytes_written != i'
drivers/gpib/ni_usb/ni_usb_gpib.c:981 ni_usb_take_control() warn: set error code if 'bytes_written != i'
drivers/gpib/ni_usb/ni_usb_gpib.c:1040 ni_usb_go_to_standby() warn: set error code if 'bytes_written != i'
drivers/gpib/ni_usb/ni_usb_gpib.c:1056 ni_usb_go_to_standby() warn: set error code if 'bytes_read != 12'
drivers/gpib/ni_usb/ni_usb_gpib.c:1384 ni_usb_parallel_poll() warn: set error code if 'bytes_written != i'
drivers/gpib/ni_usb/ni_usb_gpib.c:1555 ni_usb_line_status() warn: set error code if 'bytes_written != i'

drivers/gpib/ni_usb/ni_usb_gpib.c
    772         i += ni_usb_bulk_termination(&out_data[i]);
    773 
    774         mutex_lock(&ni_priv->addressed_transfer_lock);
    775 
    776         retval = ni_usb_send_bulk_msg(ni_priv, out_data, i, &usb_bytes_written,
    777                                       ni_usb_timeout_msecs(board->usec_timeout));
    778         kfree(out_data);
    779         if (retval || usb_bytes_written != i)        {
                              ^^^^^^^^^^^^^^^^^^^^^^

We should set an error code if the usb_bytes_written are not what we
expect.  But actually since most callers get this wrong it would be
better not return usb_bytes_written but instead just check that we
get what we expect in ni_usb_send_bulk_msg() and return a negative error
cdoe when it fails.

    780                 mutex_unlock(&ni_priv->addressed_transfer_lock);
    781                 dev_err(&usb_dev->dev, "send_bulk_msg returned %i, usb_bytes_written=%i, i=%i\n",
    782                         retval, usb_bytes_written, i);
--> 783                 return retval;
    784         }
    785 
    786         in_data = kmalloc(in_data_length, GFP_KERNEL);
    787         if (!in_data) {
    788                 mutex_unlock(&ni_priv->addressed_transfer_lock);
    789                 return -ENOMEM;
    790         }
    791         retval = ni_usb_receive_bulk_msg(ni_priv, in_data, in_data_length, &usb_bytes_read,
    792                                          ni_usb_timeout_msecs(board->usec_timeout), 1);
    793 
    794         mutex_unlock(&ni_priv->addressed_transfer_lock);
    795 
    796         if ((retval && retval != -ERESTARTSYS) || usb_bytes_read != 12) {
                                                          ^^^^^^^^^^^^^^^^^^^^
Same.  Except if retval is -ERESTARTSYS then probably usb_bytes_read is
not going to be 12 so that might be another issue as well.

    797                 dev_err(&usb_dev->dev, "receive_bulk_msg returned %i, usb_bytes_read=%i\n",
    798                         retval, usb_bytes_read);
    799                 kfree(in_data);
    800                 return retval;
    801         }
    802         ni_usb_parse_status_block(in_data, &status);
    803         kfree(in_data);
    804         switch        (status.error_code) {
    805         case NIUSB_NO_ERROR:
    806                 retval = 0;
    807                 break;
    808         case NIUSB_ABORTED_ERROR:
    809                 /*
    810                  * this is expected if ni_usb_receive_bulk_msg got

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
