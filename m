Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ACD7A
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1647370046;
	bh=wovb6kZT2Sne2tbxUxcchS5UK7kD/TEn0ztb8HjtObQ=;
	h=From:To:Cc:Subject:Date;
	b=ZpMMl7zOLbGNGCUunjDS1O5hTXnzCjLE8+epASk+k1D/e4m3RIhDcw284crQ3soHP
	 DcNjd+C/5h85OIjs18MCmKX1JHLXwO1P61BKJkd3A4z50w7Pfq9/0Ih/+NeiPy2scN
	 kCqi/y8zS92mgvSFighHo2h4FXWMpb5FAIlJ0utc=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id AA5BCE99; Tue, 15 Mar 2022 22:42:37 +0800
X-QQ-mid: xmsmtpt1647355357tmli9xpaz
Message-ID: <tencent_7F2A8AAFF05125C6FF159033E69B5C108E07@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjLrdrsX39shVro39worYR1UDLSN2cTyEArcFFifoOABgXifLxwX
	 6JFdXmQ7B/PQCQbi0Z5tftnnOjpmVgZD8RCJnkc0ADg5oiDEqwS4lcakdY7R4gdtg0YUSrlF44FE
	 IEBz08CP03lfcyTGcinz1HXZlHUzXdSi26BEKEVLWCe3PSpcUOPeMWg+HSgXlbSUaHUr6a7OSaPg
	 ty5Wn9GRqRls5YcCMRraDw9jBN1xXZ+N3yrryrhRKq3fJ8og86F3Dc7RZ/bqYxZa3NW/Upvxw608
	 U6u1DNffgjKSp+sMcyENm7FT+DWY/NPSC86MwjroOuSgb4TnQSDG5qnDemkhXhxeSJOsfOyH/cVh
	 MaQYgU1dYv/akE2ojDUWB2gbCipRN6opdoyQpYBZu52lToH3IOMiH1j1mluS4qdL1zMCyg3wP92S
	 r91pM7JpAAoNdbzF1TUSlTXRB9QL3rkh/hoRdKZGMEWaLFD1RU8sud4YyLmHnpF/NSxJ6l+v/Wru
	 Gf5kDwnbJxtlShFh1Bi/9KfNqd6wSg8ymYH0aFp+Jf9+pOgX25i096QFdpOKy3/wctohsLnrZpL/
	 eaVP+QGpYTDJrkRWymozTM0pNLnP/TnrRQYwWsXk/eb54mNty/xOhAsy1XqiJX+1m/WBe2E5TNMH
	 bvfFM+gj59CLjM5LlGsHv+SLbQG+zGnuPmM8vWrOX+y+Ym/S9FSAIdJTVITZBeJX84vThfzuCpz7
	 OecP4pIQypCJwJtqewUwqlTqdueZJr4UYRIMhm00ER+Lm7tVnk6JSgl9xA4Dev/6iPG57sunKNRs
	 3eIL1EGLVPb+aFHuFOvE+Sovup3Hd7jpJTi8CxLeHo5AiW/8cUZsBrtQYn7Mu+gVY43CpxJgI5T3
	 ZzrFKCPBJDsgJgFNnaw9u6eo+75KUTXQpvJvMutOE9+SPH7DTdHMIA3oAemwkp0cpQ3UHta8AgPz
	 jmFyPeWMNv7fDu+FwSyVYX2xFw4Qaynv2O9VtkDQU=
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org,
	nsaenz@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v2] staging: mmal-vchiq: add a check for the return of vmalloc()
Date: Tue, 15 Mar 2022 22:42:07 +0800
X-OQ-MSGID: <20220315144207.623-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

vmalloc() is a memory allocation API which can return NULL when some
internal memory errors happen. So it is better to check the return
value of it to catch the error in time.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2  jump to the proper location and remove redundant instruction.
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 76d3f03..ff4b484 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1909,6 +1909,10 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 	mutex_init(&instance->vchiq_mutex);
 
 	instance->bulk_scratch = vmalloc(PAGE_SIZE);
+	if (!instance->bulk_scratch) {
+		err = -ENOMEM;
+		goto err_free;
+	}
 	instance->vchiq_instance = vchiq_instance;
 
 	mutex_init(&instance->context_map_lock);
-- 
