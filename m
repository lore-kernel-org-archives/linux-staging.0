Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70137D13A
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199286; cv=none; b=A3usR0kIuC3xxhn6q6ZL9z2qP77+FruLCd43zoiIC4+Icf0VAqYrhyC6t1Njiw5bmm2/jdAhWQ5QFau8urTtsgPxikDb4bGgPmBNAjCoKjsWA69l3coT9ovn6mg+xDVwCar5lt3NqQNzZguXvZ/6qZdHZ+vb/MYKMjLzLCjvoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199286; c=relaxed/simple;
	bh=e4MUNal98QDFlUtIBqFtkylSQCrkzf7DR/AocA/eU1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8Ig9W1q/iAVwtm+urAIWJM9z/T1h72n1njCuqw4I2hiwFMpOtJlyNNcrL4DRef4OiRiCPT9kwuUEyvEk6QZF8NCZx7ift8Q4Ra2DPahOU/6TauaocWrxWZRhKBPYlYYUQemnZqt6yHBq3R0nME25HLoxVONw9J44ZShlCyZyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p50yBVgV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p50yBVgV"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48436216a98so982042f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199284; x=1788804084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gkOWRVQG6iCB/P+zlnyDW+laFCqIIA6uzGOxBXE3Sw=;
        b=p50yBVgVPaiDjeWbIUqW2cOJWxP3u5GYu52TNzfGPhEBNGbCqiOFptQ+5I3P7SJVWj
         uvuu6YFX1FXDSFMk30mmqD7gv2oojR9z2DNd/MJC22IIUmiV9KoSX7WyCLleSe5HIiLP
         cq23cx9XhcdVmYEqnDm0EPQdKAYIbn3RlI2xbZzgcM/RisGzhxFpEja7pXtEAHPRQ4PI
         KioD5wHTCj7OFVy7LAhMW+hVbihf8wH7vFGuQlfF3EWavMCJA0FJE8OZ/dIXwTmDoXmL
         NYjlLzYKG5vUcdXDM4x11ownEwpvB/YLaPo6Fy+AT1oH6/sRthHGqAejFN69VeXSfWPU
         AZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199284; x=1788804084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5gkOWRVQG6iCB/P+zlnyDW+laFCqIIA6uzGOxBXE3Sw=;
        b=fr4QClm3hW8ZgDW9+QVACaqZrYW4rydZ1EEGjzzviHyVsxx2F19R4grRen9U1TMgJb
         6w9d2mdwA6eOqbewLw06ng/iTq+i2GMIbibE13QK8V2HruHfzgKCBQTQhF55yJUEA0LQ
         Fuqjao8fBnVUQLGgiPLS6BVcfkYMDgnZqgm1bPFx78V0fZkhqzmDPLVEpAGnp69VwtY/
         tjT+NsSgV/1tlC3jekNa4JTikc+p9wQjzTnBS5DKfCxLK+jyuARiAJnCl+UTAaCGnlCJ
         qJR+sgHPoqcc3neqYSmVfvum/qL7qVE9jZeHWNn4inVQY1I4I+dcyKsqySusob9d4qlF
         QYlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjr9GKuqWj1gFptuuGOPFo0ad4gUWcrDiwjRN3HaO0TH9DtxWOmCUDcP1BtjyaL2IN9P9KFNGl8MEdSPjl@lists.linux.dev
X-Gm-Message-State: AFuF++nl1u1x/qmuA5HPgjOdQd+zJDwRLBxsNt6X4TX0wRR3NGT0eYIq
	bvFKNEbhOSJH1bfaDC16noscKqW1Szbk3jG6UXA92I2aXT9ADo7Dx2du
X-Gm-Gg: AYBFou2oKDNALwpcp3sWzS9tomBYAea98aG2CNeAm2C+L4UrLI9OUG1rZ76iQGUkWKO
	NlR0KcCpG5yONIhawXAzdAY9kaVvqoRcSOvFoLlOgkO3APn9mDXxWzXNYmALv2APQtFrz/IXjRM
	aK3k5cd25p4fPGPnq8qVZDskKvfqZQgQXP/BlZHzkRU8XzK8nC8rISQnQ7ARmyFB//pkO4YzEls
	Mc3F/HYtyD0AeqHNO3RAriPUuWwA59MB0oRigXP4IfYknEOWmFmRGCo8J+vs00cQIDExJLr5phe
	YRAQJnfUYwJ+yHRnZnG22H/9SY3/kOd5lJLePY5xmEK8mYV6ILR1PwvuRcxUI9AI+TDdRqJE+/3
	gAs/fbkaCndNEPOX48TOoqqbZ8uOByE6zTBnIYeyV39JKvRPGHFRltcuPLwFhjSx4/1SbhNqP7O
	FPnC0h0HZ6XdhNb1g5vhPr+8QWKLiQyOEhWSaPKMBPSoOB+uYiJbL+429m9l2Tpb0KIdV15RETt
	mxiNgoM/cx584oUY9THcXvrKjGPgN6jh0yOvLu54BU=
X-Received: by 2002:a05:6000:4211:b0:482:f530:c45b with SMTP id ffacd0b85a97d-482f798a6c1mr40756497f8f.5.1788199283678;
        Mon, 31 Aug 2026 11:01:23 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:22 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Mon, 31 Aug 2026 20:00:54 +0200
Message-ID: <20260831180101.3109854-10-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bridge-specific firmware parser may have more accurate link-frequency
information than the generic ACPI hardware-ID table. Let it store link
frequencies in the per-sensor bridge data and prefer those values when
constructing the endpoint software node.

Existing bridges continue to use the hardware-ID table when no
sensor-specific frequencies are supplied.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 15 ++++++++++-----
 include/media/ipu-bridge.h           |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 47317c423fad..5730a95767a2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+	if (sensor->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     sensor->link_freqs,
+						     sensor->nr_link_freqs);
+	else if (cfg->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac765456e..81645a5f8709 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -133,6 +133,9 @@ struct ipu_sensor {
 	struct software_node swnodes[SWNODE_COUNT];
 	struct ipu_node_names node_names;
 
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
+	u8 nr_link_freqs;
+
 	u8 link;
 	u8 lanes;
 	u32 mclkspeed;
-- 
With Best Regards,
Maurizio Casciano

