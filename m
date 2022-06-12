Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E07D10E0
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 16:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655049970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FBYA8hVkQyuBoMm3Tz4AxwVSoZ3ykHguumtSI5oDfIc=;
	b=cJWkvGHuYRO47MMKyjoyUFPdEtDQ874w05UQqZ7EXUoLGSAgYt6BEOSQAKgAjsX9wCb/Jv
	BpGDE57esQmFt1TUlfXONIqtn0ER0V0MWPVwyQDAvAdLoOYL0jq5byVsYWP4DTxZo6efYQ
	X+PaLiPT3V6UNhh5poH3rgPg5whqlW4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-WChyli2vNpmUe64ESY6yww-1; Sun, 12 Jun 2022 12:06:07 -0400
X-MC-Unique: WChyli2vNpmUe64ESY6yww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7587E3C01C0B;
	Sun, 12 Jun 2022 16:06:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED7042166B26;
	Sun, 12 Jun 2022 16:06:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/3] media: atomisp: fix "don't pass a pointer to a local variable"
Date: Sun, 12 Jun 2022 18:05:53 +0200
Message-Id: <20220612160556.108264-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

Hi All,

While working on other atomisp stuff I noticed that the recently
added: "media: atomisp: don't pass a pointer to a local variable"
compiler warning fix broke things.

Here is a small series reverting the troublesome fix and adding
an alternative compiler warning fix which does work in my testing.

Regards,

Hans

p.s.

A while ago I mentioned that I was working on also making the code
work on Bay Trail devices (vs Cherry Trail) and that I had things
working with an older kernel based on Alan Cox' first merge of
the driver into drivers/staging. After a lot of work to keep the
code working rebasing on newer and newer (less old really) kernels
I had gathered some fixes and decided to just try the latest kernel.

And it turns out that the latest kernel already has all those
fixes and it just works. I don't know why my previous testing failed.
I might just have been unlucky with the hw which I used in my previous
testing.

So good news, the code works on Bay Trail too, which is also good
from a pov of being able to test on both platforms while doing further
refactoring.

Mauro, you also asked me to try mmap on the original code as merged
by Alan Cox, unfortunately mmap does not work their either, it seems
this has simply always been broken. More about this in another
patch-set.


Hans de Goede (3):
  media: atomisp: revert "don't pass a pointer to a local variable"
  media: atomisp: fix uninitialized stack mem usage in
    ia_css_rmgr_acq_vbuf()
  media: atomisp: fix -Wdangling-pointer warning

 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

-- 
2.36.0

