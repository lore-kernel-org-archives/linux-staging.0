Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59945210E
	for <linux-staging@lists.linux.dev>; Mon, 15 Mar 2021 16:58:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06C4064F35;
	Mon, 15 Mar 2021 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1615827495;
	bh=hUMlzeX2OOT9aQpoS8uNLg4cA9gPhwOIS3aycuw7BiU=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=yrzLFKpkrKcGB0yQKWTHamAb/nvbsatckTSQNmxiQsoL4Afwk0T/nlz5fkWmkRpom
	 1sMvGI3Yib4IWyTcqgJPPoRug9JlC3Stqqfu2Ei3oFbuO+3WYkvgoCWJEwPvBtXFpB
	 vYuULn5AGttb0qE555G65C4JfTVD4rdpUILa/UIQ=
Resent-From: Greg KH <greg@kroah.com>
Resent-Date: Mon, 15 Mar 2021 17:58:12 +0100
Resent-Message-ID: <YE+SJAgZK1PPLxE+@kroah.com>
Resent-To: linux-staging@lists.linux.dev
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	 by sloti36d1t01 (Cyrus 3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd) with LMTPA;
	 Mon, 15 Mar 2021 11:58:26 -0400
X-Cyrus-Session-Id: sloti36d1t01-1615823906-389784-2-2541595135703865749
X-Sieve: CMU Sieve 3.0
X-Spam-known-sender: no
X-Spam-charsets: plain='us-ascii'
X-Resolved-to: greg@kroah.com
X-Delivered-to: greg@kroah.com
X-Original-Delivered-to: devel@driverdev.osuosl.org
X-Mail-from: driverdev-devel-bounces@linuxdriverproject.org
Received: from mx4 ([10.202.2.203])
  by compute3.internal (LMTPProxy); Mon, 15 Mar 2021 11:58:26 -0400
Received: from mx4.messagingengine.com (localhost [127.0.0.1])
	by mailmx.nyi.internal (Postfix) with ESMTP id 48D717C0137
	for <greg@kroah.com>; Mon, 15 Mar 2021 11:58:26 -0400 (EDT)
Received: from mx4.messagingengine.com (localhost [127.0.0.1])
    by mx4.messagingengine.com (Authentication Milter) with ESMTP
    id 3B63A824818;
    Mon, 15 Mar 2021 11:58:26 -0400
ARC-Seal: i=1; a=rsa-sha256; cv=none; d=messagingengine.com; s=fm2; t=
    1615823906; b=QJ61ljvyAEXsyUG02xUp33lwKfhzkpeT/dymgvxVhIiFK6EwQK
    onPLqTNGUJUzeWndlJwmffWvN+E7+BIkUgm5wawTPbOFl2Cu/QpdqCnjH5/Czm9R
    LM1vwaWaOjpCRnu6rxXln0quGQJPhEk4A7B3Q38HLSfghOeZhMkSwa5x2jus/S/h
    D2WkgGQhknH/hD9BPjWJ6oBHYtk9TFJZO7dscmoI1d0V+wtE1pV8ie62zucyGQaF
    +0HzaW2WPtCq9qs6flHVE2GxvtcsSgU8onOILbbi0di30ncaMI+fgZtazhaVm1HA
    IDv3oYxvbWW3d1Yyiw8ZanbsjqETUq8OmItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=
    messagingengine.com; h=date:from:to:subject:message-id
    :mime-version:list-id:list-unsubscribe:list-archive:list-post
    :list-help:list-subscribe:cc:content-type
    :content-transfer-encoding:sender; s=fm2; t=1615823906; bh=sswpB
    HMvKVmNRtZgyAATJK9W+wbN4JLejwTgux6XSWk=; b=ErHdKWL50Yqf9k05/hRZH
    zakkrwXzmHWrwe6bYCJdbOlE/9B0gkxGz+i4nl3rFPxlFjqRw3UU2jxBhm4y0Iv8
    zB/3lm0vEcX8IAJefideU5ljBAKlzdP41v6aX+2OcBLJc13Xe4qhK5N8o1EQ8PAi
    WuMHclOArvMNa5Jw452WEDEslDbq+UV9J1dfvnQB/GIzeLfJFX79wuXiRQqo/n28
    H+CkH6ErSqXnHbhVjxF7fhmqAzOrsLSXiPPFaBBUk9Yo60LAynjVg2MtL4QLWZ0O
    Y9kdHKBk7cCkyjvFDAqCanwX135EmpjgKVbH1XD3EDcEcVfIGclpaajaF2Dcp0/q
    g==
ARC-Authentication-Results: i=1; mx4.messagingengine.com;
    arc=none (no signatures found);
    bimi=skipped (DMARC did not pass);
    dkim=fail (body has been altered, 1024-bit rsa key sha256)
    header.d=linuxfoundation.org header.i=@linuxfoundation.org
    header.b=ZUqZqoai header.a=rsa-sha256 header.s=korg x-bits=1024;
    dmarc=fail policy.published-domain-policy=none
    policy.published-subdomain-policy=none policy.applied-disposition=none
    policy.evaluated-disposition=none policy.override-reason=mailing_list
    policy.arc-aware-result=fail
    (p=none,sp=none,has-list-id=yes,d=none,d.eval=none,override=mailing_list,arc_aware_result=fail)
    policy.policy-from=p header.from=linuxfoundation.org;
    iprev=pass smtp.remote-ip=140.211.166.137 (smtp4.osuosl.org);
    spf=pass smtp.mailfrom=driverdev-devel-bounces@linuxdriverproject.org
    smtp.helo=smtp4.osuosl.org;
    x-aligned-from=fail;
    x-csa=none;
    x-me-sender=none;
    x-ptr=pass smtp.helo=smtp4.osuosl.org policy.ptr=smtp4.osuosl.org;
    x-return-mx=pass header.domain=linuxfoundation.org policy.is_org=yes
    (MX Records found: ASPMX.L.GOOGLE.COM,ALT1.ASPMX.L.GOOGLE.COM,ALT2.ASPMX.L.GOOGLE.COM,ALT3.ASPMX.L.GOOGLE.COM,ALT4.ASPMX.L.GOOGLE.COM);
    x-return-mx=pass smtp.domain=linuxdriverproject.org policy.is_org=yes
    (MX Records found: smtp3.osuosl.org,smtp4.osuosl.org,smtp1.osuosl.org,smtp2.osuosl.org);
    x-tls=pass smtp.version=TLSv1.3 smtp.cipher=TLS_AES_256_GCM_SHA384
    smtp.bits=256/256;
    x-vs=clean score=0 state=0
Authentication-Results: mx4.messagingengine.com;
    arc=none (no signatures found);
    bimi=skipped (DMARC did not pass);
    dkim=fail (body has been altered, 1024-bit rsa key sha256)
      header.d=linuxfoundation.org header.i=@linuxfoundation.org
      header.b=ZUqZqoai header.a=rsa-sha256 header.s=korg x-bits=1024;
    dmarc=fail policy.published-domain-policy=none
      policy.published-subdomain-policy=none policy.applied-disposition=none
      policy.evaluated-disposition=none policy.override-reason=mailing_list
      policy.arc-aware-result=fail
      (p=none,sp=none,has-list-id=yes,d=none,d.eval=none,override=mailing_list,arc_aware_result=fail)
      policy.policy-from=p header.from=linuxfoundation.org;
    iprev=pass smtp.remote-ip=140.211.166.137 (smtp4.osuosl.org);
    spf=pass smtp.mailfrom=driverdev-devel-bounces@linuxdriverproject.org
      smtp.helo=smtp4.osuosl.org;
    x-aligned-from=fail;
    x-csa=none;
    x-me-sender=none;
    x-ptr=pass smtp.helo=smtp4.osuosl.org policy.ptr=smtp4.osuosl.org;
    x-return-mx=pass header.domain=linuxfoundation.org policy.is_org=yes
      (MX Records found: ASPMX.L.GOOGLE.COM,ALT1.ASPMX.L.GOOGLE.COM,ALT2.ASPMX.L.GOOGLE.COM,ALT3.ASPMX.L.GOOGLE.COM,ALT4.ASPMX.L.GOOGLE.COM);
    x-return-mx=pass smtp.domain=linuxdriverproject.org policy.is_org=yes
      (MX Records found: smtp3.osuosl.org,smtp4.osuosl.org,smtp1.osuosl.org,smtp2.osuosl.org);
    x-tls=pass smtp.version=TLSv1.3 smtp.cipher=TLS_AES_256_GCM_SHA384
      smtp.bits=256/256;
    x-vs=clean score=0 state=0
X-ME-VSSU: VW5zdWI9bWFpbHRvOmRyaXZlcmRldi1kZXZlbC1yZXF1ZXN0QGxpbnV4ZHJpdmVycHJvam
    VjdC5vcmc_c3ViamVjdD11bnN1YnNjcmliZQ
X-ME-VSSU: VW5zdWI9aHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qub3JnL21haWxtYW
    4vb3B0aW9ucy9kcml2ZXJkZXYtZGV2ZWw
X-ME-VSCause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuf
    fkggguphejjfegudeftdgtgfgvshesthejredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnhepudetgffftedvgeekvdegteehiefhffefheektefgleehhfffteduveev
    geevkeefnecuffhomhgrihhnpehlihhnuhigrdguvghvpdhkvghrnhgvlhdrohhrghdplh
    hinhhugigurhhivhgvrhhprhhojhgvtghtrdhorhhgnecukfhppedugedtrddvuddurddu
    ieeirddufeejpdduleekrddugeehrddvledrleelnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehinhgvthepudegtddrvdduuddrudeiiedrudefjedphhgvlhhopehs
    mhhtphegrdhoshhuohhslhdrohhrghdpmhgrihhlfhhrohhmpeeoughrihhvvghruggvvh
    dquggvvhgvlhdqsghouhhntggvsheslhhinhhugigurhhivhgvrhhprhhojhgvtghtrdho
    rhhgqe
X-ME-VSScore: 0
X-ME-VSCategory: clean
X-ME-CSA: none
Received-SPF: pass
    (linuxdriverproject.org: 140.211.166.137 is authorized to use 'driverdev-devel-bounces@linuxdriverproject.org' in 'mfrom' identity (mechanism 'mx' matched))
    receiver=mx4.messagingengine.com;
    identity=mailfrom;
    envelope-from="driverdev-devel-bounces@linuxdriverproject.org";
    helo=smtp4.osuosl.org;
    client-ip=140.211.166.137
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx4.messagingengine.com (Postfix) with ESMTPS
	for <greg@kroah.com>; Mon, 15 Mar 2021 11:58:25 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39B814EA47;
	Mon, 15 Mar 2021 15:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-cKKuh826N4; Mon, 15 Mar 2021 15:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 829B64C4BF;
	Mon, 15 Mar 2021 15:58:12 +0000 (UTC)
X-Remote-Delivered-To: driverdev-devel@osuosl.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE5181BF338
 for <devel@linuxdriverproject.org>; Mon, 15 Mar 2021 15:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABBAA83661
 for <devel@linuxdriverproject.org>; Mon, 15 Mar 2021 15:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZfgefU47Huy for <devel@linuxdriverproject.org>;
 Mon, 15 Mar 2021 15:58:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3E6B8355F
 for <devel@driverdev.osuosl.org>; Mon, 15 Mar 2021 15:58:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A12764ED2;
 Mon, 15 Mar 2021 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615823889;
 bh=3ji+Q6uY/D0rI03EiK2D5j+YzlmQX7UrPD4ibSY9pes=;
 h=Date:From:To:Cc:Subject:From;
 b=ZUqZqoaiH1LEngvzBROnmPz6AH7yewKwWQFfYI5Xgzmf1mui/3BMTl/pLuvh7mo0b
 V/o/iwLYRjONi5xXW8a7B9vC9QOIdLt9/dKVlm9R/23DReUInpVtvObCWYJpvL71W/
 Ezd0jXPzdUdU/hwJbpAayxyBYmyEPpNuOoiP0Emg=
Date: Mon, 15 Mar 2021 16:58:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: devel@driverdev.osuosl.org
Subject: driverdev mailing list is moving!
Message-ID: <YE+EDpgrEU35GoNq@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
X-BeenThere: driverdev-devel@linuxdriverproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Driver Project Developer List
 <driverdev-devel.linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>, 
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>, 
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Cc: linux-staging@list.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
X-TUID: mjYEbNOvwbBX

Hi all,

After almost 14 years of being hosted by OSUOSL, the driverdev mailing
list is moving to lists.linux.dev.  This should help out with the
occasional mailman issues that driverdev had at times, and is one of the
first lists to help stress-test the new linux.dev mailing lists
infrastructure.

As the scope of this list has changed a lot since it was first created
in 2007, the new name of the list reflects what it has really been for
the past decade or so, a place for patches and development of the
drivers/staging/ subsystem in the Linux kernel.  As such, the new list
address is:
	linux-staging@lists.linux.dev

To sign up for it, go to:
	https://subspace.kernel.org/lists.linux.dev.html
and follow the instructions there.

I'll send a patch to move the list address that is in the MAINTAINERS
file to point to the new list, and this old list will probably be
retired in a month or so after everyone realizes to use the new one.

Thanks so much to OSUOSL for hosting this for so long, and for putting
up with the odd requirements of a tiny mailing list that does not
restrict postings from non-subscribers.  They have done a great job with
this over the years.

If anyone has any questions about this, please let me know.

thanks,

greg k-h
_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
