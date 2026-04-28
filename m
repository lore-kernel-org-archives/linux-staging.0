Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C352B67E
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 05:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777352869; cv=pass; b=pbuOT8U8fbvZp85wTlPk4UyEGBi46iEsP9KdwNpRQlV4OqQj3AtnYR4wnZCs8Bw4mZdCXhWgJi2p9HnnOWFxw5vcRYwaakxLUre2h9qLU7MB61lRyK3Z89aiYZDIyeyBJ2XHt4S+8sbU1PqXhhfy5DOgkhKuTm1ODwItGMwHyw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777352869; c=relaxed/simple;
	bh=RHd77gAgda8jFLJUFj8Gg9UBKJgpf/5EjkFZeZDapCA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gK8wIe9Q3z2SsH0zHo38Ity6bYV8oEYXAC/zRNi45xPNr0JyB1WaH7R1smZolUuTC5LCYe3OWbOwfVBjCoU2q4pj4O/LNFEN+pgb8QtDhD54NkZd1gNLWePfTGN5VsRAnM+XK4rDNfrjzYvlV4WaW/6I8Vok6Z+Xkkh4u/jNpq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlHLJtQ2; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlHLJtQ2"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-799001d73bdso88374627b3.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 22:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777352867; cv=none;
        d=google.com; s=arc-20240605;
        b=FQ03Sb4fb0tb6++beCG2/ZCUR7hkD2rsH5YNhUGK+5hgnnqtLsLP2yFhvJKRmfT2uk
         Fe869dm406Ze+QsSAQtkgXLrh/dcrtRbY73b4Z+9UnjZeacezVjwL/w4PJ4lzNirvcjO
         bt9elRdKpDT4O+OGuf5IKH/k5PyDRocaw0Gp2ON+l/hvLkkE+GFguI2K9MrKbquvj8rd
         bGdqRfhTMUg/4qvaXCYEVIcHMvuHqBnLDu68FMHdGyU4b42zXZaJgiTgZdVfKaJiWRG4
         JzN5yOuRGuxlAYddC5BBtuGSFgZCxMaWk7bNdmTfRsIrqIa6aSmFVcJ4cN1R8u36RTO5
         6/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=V0DeOGlegWR5yWGiIqxywx37BoAXwHcEnQSec0Aop0k=;
        fh=RHjTr/x80iqx/utB4du66ZseFx8qGO93OfjDDxIFVQI=;
        b=YXKq9GtSHI91JLLE+fHWcNUW3bi9icUqXFOYzn+kSqq21l4lFTEyyh9M5xmxdtSuG2
         c7Sh7e3B/HvvNrbCCdhnsFgiKvKEeJ42aQEr5xZ7aR+pcJVy5ZHTsCcRkYIRrlKtslPl
         SrVa6lW+FDxuOQYUXs6lzsrUrP6vigxPeL25z6U6QhRMDi+ZUWZtq9+QgW/IgZKTk/+Z
         slZ9iwfUZy59P9ZvUk8GN6rBa0m7DSlMVtIGw7+K/gF4bRTlZ4pWrV7N04KdZ+IExmnO
         KaOdzS+Ss+PggOguk9xPdKj+FoiUt7uA5Qa6WIUTmxpg+8OJEeHMAOJi1sfzm8b1KVgh
         k0iw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777352867; x=1777957667; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V0DeOGlegWR5yWGiIqxywx37BoAXwHcEnQSec0Aop0k=;
        b=WlHLJtQ2TuFgFhWG86TnZ2cb1x8NGL4vK31H2pOUTThLZyBlHmHGpDgOHPZ09Wj9je
         EZalpDLoc3K1C+HDDti1FWKGu+W55AGep9/I0Uyl0o19zotdMzprEqclP40L0cXZDUR7
         yK+eRwOadp2d+cZ2+6ErSsAx1gvGQ8iyjHdkUphecYztdXD811D42usKkyOE53DlPtM2
         0VW3zvBKFx/Gxd+Q7+9kXrPmrBko6c6Bbfh7LuyB0ebUPWmc98WSTQ5KgM2ipseGRmzs
         uzkGSu5mqorCMOV+Phq1enPGPZ9OFyRDLA790LX4QiElYza360V5RRXuWGnA3gkRCESj
         nh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352867; x=1777957667;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0DeOGlegWR5yWGiIqxywx37BoAXwHcEnQSec0Aop0k=;
        b=WNBbZB+WllsMpEFYVlfIIGX7oj1NdVqWK/lwgGS9b04K8O1hUpIp+nv+KTOyntWnN6
         DFk7YnEmfvgyc9Cn4kwy7Hgn3kjRibEl/wr3zZhN2BXPSublDqWa6EGLTpCuaUu5sZPF
         +olJFyeInWddq9lrasD7ni+da6x9aJwpFpiWzpeywShO9fFvPZlx1TUlSAxVim3ijowL
         eheL7cMClrmJ8eRsCz7gBPw4Z5vrEtb+hvMv/Hik9fpfnyWsQfm2JSgNOkEVNiW2P+4s
         KNqkPolDF3J0SrOMteu2MeHey/meHfjw4kRlmsMBT1ABphnncoGbIfEJnuTd/0XhE/VO
         +xbA==
X-Gm-Message-State: AOJu0Yw5fvGE5wNCv+xSueKKy5kZwFKD1TusyVZzns5r1BzfeS6qn7yj
	8LFxGxcXX+oxmqad5G8bjx2R9NSpnKzyc4fAJMrWMds+6gNjxN8vx12jMYGUIJ8dNtvWQSbI0QS
	gvDxdsymqLeHvhZV+D0o7auoFm0hr0Gk=
X-Gm-Gg: AeBDieueifKwj+M4klLihl2Jy2IOEKRZmuESdW4Ab9mV84lvLrdZTorniozNts4Q7eq
	42WoF46emKNE2hpqk9M+0WQaS/dz8sYM3t5nX2lUxZS4UcNTcFgKMKa5c6v0JnHXTWBJkKXehNV
	U2In6oPlHs0hwqgj3tLFKjAVCSP++lgMfPPzqfPxZRpnlrzlJf05+woaqvJxXjNdboW3xfagPB/
	qCsdmmkD1RtOsRM4TDCborqHm4VQZtQtcj1629sshLD//dXoHQAwsDATMW1TKJChp0yJReG4InS
	URKCCUMYWTx6DaBs4olxU0bzSZJowwY=
X-Received: by 2002:a05:690c:6605:b0:7ac:24ba:3e61 with SMTP id
 00721157ae682-7bcf5214f41mr12947727b3.19.1777352867212; Mon, 27 Apr 2026
 22:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Tue, 28 Apr 2026 13:07:36 +0800
X-Gm-Features: AVHnY4LX0vg74K1G7RYozbndHHH-4VLDXHaburN6laB8dGEBJwxSHUJ4ODvgCIM
Message-ID: <CAGp+u1YiO_nf4dNvEtxTDWv86D80ac4TrP1-DhrYuQtt-JsyoA@mail.gmail.com>
Subject: [bug report] Potential order bug in 'drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c',
 primarily in 'skel_disconnect()'
To: dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear Linux kernel maintainers,

My research-based static analyzer found a potential order bug within
the 'drivers/staging/gpib/lpvo_usb_gpib' subsystem, more specifically,
in 'drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c'.
This bug is similar to a previous bug report as discussed in
'https://lore.kernel.org/linux-usb/2026042718-unwieldy-dicing-626f@gregkh'.

Kernel version: long-term kernel v6.18.9

Potential concurrent triggering executions:
T0:
skel_disconnect
    --> usb_set_intfdata(interface, NULL);
    --> usb_deregister_dev(interface, &skel_class);
         --> usb_minors[intf->minor] = NULL;
T1:
usb_gpib_attach
   --> skel_do_open
       --> interface = usb_find_interface(&skel_driver, subminor);
       --> dev = usb_get_intfdata(interface);

In T0, the interface is nullified before its get deregistered. Thus,
it is possible for T1 to still get the usb dev and access it via the
interface, which, however, has been already nullified.

Thank you for your time and consideration.

Sincerely,
Ginger
