Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8160F1EE01F
	for <linux-staging@lists.linux.dev>; Tue,  7 Jan 2025 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736257846; cv=none; b=idKC4rLxsFspqrGGjp+f+s6PaJld7xvXVGdQY2QpejDkj4YDDG1Bl8NWpVFrtzPZznNr/W5rrnHg2+D3hs/kYMbcUyM7PV0AuyGtwzPwEYaQI1pm0lu7ExauLPmIcu2IFsM7HG/ne+hZOabHmgrZ2CyjKthAzlF/6J/tPkuy6rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736257846; c=relaxed/simple;
	bh=25YVvJwi2Xjlkzv9WtWyYjLUmIh+R6dUhQ8sSYCiVuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=VYgmHojxFRG6je+y/SnJLuN0IZwunSMsRdA+rN9hKNOyZI9Qblh1ERT/VNhtkrnM1BD7aBTLY5KgUNj7I1+Ryciv2VgYUahX0KVvhmUX6VWUim8j5BGn7VXad9AO2bSC2snhVp3tf3ALYKYnHR/mUQqkKK6fSjx+1vNjyk9luc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X48S75Mh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X48S75Mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736257843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JEU5DIrN0YF2UNspXPf/7Xs7dl1aHNEC4BRgGEqAXYI=;
	b=X48S75MhMcWr/isC4bpmBGPpAq5LKPvxwLOREQKtF9yXN1xMiMmAqBeQyTlFW7YmqH6QGF
	0NDbPH2KhM+o+04SFq1HWrmr3VMWTGDy5cVXov4Iygvn3kzYYZoASclBFe7QN0q9J6FqRT
	ptOwYRFa+vhBfUzH1LXXkLfxg1Q/Mh4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-mbFJMDYDONCo1-Bu-Tn2Jg-1; Tue, 07 Jan 2025 08:50:42 -0500
X-MC-Unique: mbFJMDYDONCo1-Bu-Tn2Jg-1
X-Mimecast-MFC-AGG-ID: mbFJMDYDONCo1-Bu-Tn2Jg
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b9f0bc7123so1655080885a.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Jan 2025 05:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736257841; x=1736862641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEU5DIrN0YF2UNspXPf/7Xs7dl1aHNEC4BRgGEqAXYI=;
        b=G8v6xmrlBLdpS1ehIYxaZHX1jpPdioo4O3zKn6ihUcH2ZjKkIlwUTegCHjzUCb6PGp
         kaxviNy8BnH0DOj9Cp84fDft2v6F21VX0hmVXdmyjdiKN9r8Xl2rt71q/pG1EWg/tR8Y
         biYWp0++h8LCAm23jMMR7HdEj6UnYRsSW0kZQI06Q1yB04+zPc1hmsE6we66bxzZpKrT
         Cm5IDX4y/nSRtuDa+WISblqEtUhNtt0sPfS38lT3M/SpPoI0J7w/60KFbsSbYhXMAMgf
         Qd4aC4MejZqHq8Qr3+OJejcNSYBHjtJTNB8q5pfA1RRI3Z3V+56S4X0b5j5DEnzf0LjN
         OVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLqbsqxy1H3SMRgJp5lA9fnWbWJnz9JCWBoZcHDrwaiEaCXTobgvJ0ibEA6ZGuXJZHONyUJxvsU0z2gbce@lists.linux.dev
X-Gm-Message-State: AOJu0YxCTJXjnY1Yss9ZfITP51N9JwBBSeVT+sV2h8BcEgrjtgBQpzGk
	Kv6UUznX70FbXEkLpLDaSKAKw5z6yEkKoOc8SaV0aEeCB0PSRdiy+axObP3Lw27s0q2C2H33wYc
	OWFyj/cFfnzWwf4k3kzoDWx5+p6VB+/0xgfGD8eItk1oaQTircSd0k5X3pDJe0PU=
X-Gm-Gg: ASbGncsjmZesSLF9TEkL+lof9KsbZAwd0ZeZKlbw77UA/D6kyaFh66JNqwGHzGpLn65
	Acat8QOi5IFXAulX3NpAtxDcuKNsBMfTemqL9zybGvBstpbp4AKMlTw7rJmwdGaVliGtTvzsCzv
	LH8PJScSs87vTN2cX658+FVEJ2bO6yyutsybEHfN3/cMu6048dFp5be7uOcQzMHLPCVREiv3/Mz
	vJnbzMwV+n2DU4vZe0kibOgVyBNggIBgc7tWJ+QcafFotTdNkPDBFVd99k5o0h5lTeJfmbM21E/
	JrZsPTKedWGFo1x8y0EaaFpLrKqx
X-Received: by 2002:a05:620a:1998:b0:7b6:f024:3ca with SMTP id af79cd13be357-7b9ba8358a6mr8715776885a.58.1736257841701;
        Tue, 07 Jan 2025 05:50:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFANf+z1z3KdYW+6x6UlHOT4pYepUgwCvqnrxCM2s9PlJ10sXv+tzuVFh//bx7jVUURvptS+w==
X-Received: by 2002:a05:620a:1998:b0:7b6:f024:3ca with SMTP id af79cd13be357-7b9ba8358a6mr8715774085a.58.1736257841400;
        Tue, 07 Jan 2025 05:50:41 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac480936sm1591427385a.72.2025.01.07.05.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:50:40 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] staging: gpib: refer to correct config symbol in tnt4882 Makefile
Date: Tue,  7 Jan 2025 14:50:32 +0100
Message-ID: <20250107135032.34424-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OsUBr6vzj9eW6YuErPM15u5bs2zKiZu4hkdjhv17SYA_1736257842
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 79d2e1919a27 ("staging: gpib: fix Makefiles") uses the corresponding
config symbols to let Makefiles include the driver sources appropriately in
the kernel build.

Unfortunately, the Makefile in the tnt4882 directory refers to the
non-existing config GPIB_TNT4882. The actual config name for this driver is
GPIB_NI_PCI_ISA, as can be observed in the gpib Makefile.

Probably, this is caused by the subtle differences between the config
names, directory names and file names in ./drivers/staging/gpib/, where
often config names and directory names are identical or at least close in
naming, but in this case, it is not.

Change the reference in the tnt4882 Makefile from the non-existing config
GPIB_TNT4882 to the existing config GPIB_NI_PCI_ISA.

Fixes: 79d2e1919a27 ("staging: gpib: fix Makefiles")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/staging/gpib/tnt4882/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/tnt4882/Makefile b/drivers/staging/gpib/tnt4882/Makefile
index 04a4520ed3b7..a3c3fb96d5ed 100644
--- a/drivers/staging/gpib/tnt4882/Makefile
+++ b/drivers/staging/gpib/tnt4882/Makefile
@@ -1,5 +1,5 @@
 ccflags-$(CONFIG_GPIB_PCMCIA) := -DGPIB_PCMCIA
-obj-$(CONFIG_GPIB_TNT4882) += tnt4882.o
+obj-$(CONFIG_GPIB_NI_PCI_ISA) += tnt4882.o
 
 tnt4882-objs := tnt4882_gpib.o mite.o
 
-- 
2.47.1

